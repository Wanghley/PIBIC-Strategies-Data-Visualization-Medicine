import bluetooth
import csv
import threading

class CreateFile(threading.Thread):
	def __init__(self,name,age,sex,stat):
		threading.Thread.__init__(self)
		self.name = name
		self.age = age
		self.sex = sex
		self.stat=stat
	def run(self):
		f = open("/data/"+self.name+".csv","w+")
		f.close()
		csv_file = open("/data/"+self.name+".csv",'w',newline='')
		writer = csv.writer(csv_file,delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)
		writer.writerow(["name:{}".format(self.name),
						 "age:{}".format(self.age),
						 "sex:{}".format(self.sex),
						 "stat:{}".format(self.stat)])
		csv_file.close()

class SaveData(threading.Thread):
	def __init__(self,data,file):
		threading.Thread.__init__(self)
		self.data = data
		self.file = file
	def run(self):
		csv_file = open(self.file, 'w', newline='')
		writer = csv.writer(csv_file, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)
		writer.writerow(self.data)
		csv_file.close()

if __name__ == "__main__":
	# BT MAC ADDR da raspberry ou do cliente?
	bd_addr = "00:18:E4:40:00:06"
	port = 1
	sock = bluetooth.BluetoothSocket(bluetooth.RFCOMM)

	# Subject information
	subject_name = input("Type the name of the subject: ")
	subject_age = int(input("Type the age of the subject: "))
	subject_sex = input("Masculine or Femine subject?(M/F)? ")
	subject_stat = input("Is the subject a detected parkinsonian?[Y or n]: ")

	try:
		createCSV = CreateFile(subject_name,subject_age,subject_sex,subject_stat)
		createCSV.run()
		createCSV.join()
	except:
		print("ERROR CREATING CSV DATA FILE!!")

	path = "/data/"+subject_name+".csv"

	while (True):
		sock.connect((bd_addr, port))
		print('Connected')
		# sock.settimeout(1.0)

		# O que deve ser digitado para iniciar a comunicação?
		s = input()
		sock.sendall(s.encode('ASCII'))
		data = ''
		try:
			while (True):
				data += sock.recv(64).decode('ASCII')
				if '#' in data:
					data = data.split('#')
					data1 = data[0]
					data = data[1]

					if data1 == "ok":
						sock.sendall('c')
					elif data1 == "stop" or "stop" in data:
						break
					else:
						dataLine = data1.split(',')
						saveData = SaveData(list(dataLine),path)
						saveData.run()
		except Exception as inst:
			print(type(inst))  # the exception instance
			print(inst.args)  # arguments stored in .args
			print(inst)
			print("Erro")
			sock.close()

		sock.close()
