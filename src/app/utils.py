from patient import Patient
from datetime import datetime
import bluetooth
import time
import csv


def createFile(path, patient, file_type):
    try:
        time = datetime.now().strftime("%d%m%Y-%H-%M-%S")
        file_path = path+"/"+patient.name+"_"+time+".csv"
        open(file_path, 'w+').close()
        return file_path
    except Exception as e:
        print("ERROR CREATING CSV DATA FILE!!")
        print(e)

def createHeader(file_path, patient, tsk_duration, tasks, startTime, header):
    try:
        with open(file_path, 'a') as csvfile:
            writer = csv.writer(csvfile)
            writer.writerow([startTime, "task duration: " +
                            tsk_duration, "tasks: "+str(tasks)])
            writer.writerow(['name:'+patient.name, 'sex:'+patient.sex,
                            'birthday:'+patient.birthday])
            writer.writerow([header])
            csvfile.close()
    except Exception as e:
        print(e)
        print("Error creating header!")


def connectBluetooth(address, port=1):
    sock = bluetooth.BluetoothSocket(bluetooth.RFCOMM)
    sock.connect((address, port))
    time.sleep(2)

    return sock


def findBluetoothDevices(duration):
    nearby_devices = bluetooth.discover_devices(
        duration=duration, lookup_names=True)

    devices = ['Select a device']

    for addr, name in nearby_devices:
        devices.append(name+" | "+addr)

    return devices
