import bluetooth
import sys
# BT MAC ADDR da raspberry ou do cliente?
bd_addr = "00:18:E4:40:00:06"

port = 1
sock = bluetooth.BluetoothSocket(bluetooth.RFCOMM)
while (True):
	sock.connect((bd_addr, port))
	print ('Connected')
	#sock.settimeout(1.0)
	
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
				print ('%s'%data1)
				if data1 == "ok":
					sock.sendall('c')
				elif data1 == "stop" or "stop" in data:
					break
	except Exception as inst:
		print(type(inst))    # the exception instance
		print(inst.args)     # arguments stored in .args
		print(inst)
		print("Erro")
		sock.close()

	sock.close()
