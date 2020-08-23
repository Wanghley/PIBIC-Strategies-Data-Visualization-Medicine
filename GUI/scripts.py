import csv
import threading
import os
import time

class CreateFile(threading.Thread):
	def __init__(self,path,patient):
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