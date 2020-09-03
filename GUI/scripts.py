import bluetooth
import csv
import os
import threading
import time
import datetime
import sys

class CreateFile(threading.Thread):
	def __init__(self,path,patient):
		threading.Thread.__init__(self)
		self.path = str(path+'/'+patient.name+'.csv')
		self.patientName = patient.name
		self.patientBirthday = patient.birthday
		self.patientSex = patient.sex
	def run(self):
		try:
			f1 = open(self.path,'w+')
			f1.write("name: {},".format(self.patientName)+
				"age: {},".format(self.patientBirthday)+
				"sex: {},".format(self.patientSex))
				#"parkinsonian? {},".format(subject_stat))
			f1.close()
			return True
		except Exception as e:
			print('ERROR on creating file saving')
			print(e)
			return False

class BluetoothDevice(threading.Thread):
	def __init__(self,sock,device): #
		threading.Thread.__init__(self)
		self.sock = sock
		self.device = device
		self.connected = False
	def search(self):
		devices = bluetooth.discover_devices(duration=20, lookup_names = True)
		return devices
	def connect(self,dev):
		address = dev
		# print(address)
		port = 1
		sock = bluetooth.BluetoothSocket(bluetooth.RFCOMM)
		try:
			sock.connect((address, port))
			# print('Conectado com sucesso!')
			dev = BluetoothDevice(sock,dev)
			dev.connected=True
			return dev
		except Exception as excp:
			print('ERRO!')
			print('Falha na conexão')
			print(excp.args)
			print(excp)
			sock.close()
			return False
	def disconnect(self,device):
		try:
			device.sock.close()
			return True
		except:
			print('Failed to disconnect!\nJust close the app')
			return False
	
	def run(self,method,arg):
		if method=='search':
			return self.search()
		elif method=='connect':
			return self.connect(arg)
		elif method=='disconnect':
			return self.disconnect(arg)
	
class UpdateData(threading.Thread):
	def __init__(self,data,file):
		threading.Thread.__init__(self)
		self.data = data
		self.file = file
	def run(self):
		csv_file = open(self.file, 'a', newline='')
		writer = csv.writer(csv_file)
		writer.writerow(self.data)
		csv_file.close()
class CollectorCommunication(threading.Thread):
	def __init__(self,device,file):
		threading.Thread.__init__(self)
		self.sock = device.sock
		self.address = device.device
		self.file = file
	def acknowledge(self):
		data=''
		self.sock.sendall('s'.encode('ASCII'))
		try:
			while(True):
				data += self.sock.recv(64).decode('ASCII')
				if '#' in data:
					data = data.split('#')
					data1 = data[0]
					data = data[1]

					if data1 == "ok":
						self.sock.sendall('c')
						csv_file = open(self.file, 'a', newline='')
						writer = csv.writer(csv_file)
						writer.writerow(datetime.datetime.now())
						csv_file.close()
						return True
		except:
			return False
	def getData(self):
		data = ''
		data1 = ''
		while(True):
			data += self.sock.recv(64).decode('ASCII')
			if '#' in data:
				data = data.split('#')
				data1 = data[0]
				data = data[1]
			if data1 == "stop" or "stop" in data or "SudoStop" in data:
				open(self.file).close()
				for i in range(10):
					print("Saving and finishing data saving..."+str(i))
					time.sleep(1)
				return
			else:
				dataLine = data1.split(',')
				data1=''
				saveData = UpdateData(list(dataLine),self.file)
				saveData.start()
				saveData.join()
	def finish(self):
		return
	def run(self,method):
		if method=='acknowledge':
			return self.acknowledge()
		elif method=='getData':
			self.getData()
		elif method=='finish':
				self.finish()