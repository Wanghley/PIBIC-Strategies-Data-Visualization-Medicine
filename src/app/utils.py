from patient import Patient
from datetime import datetime
import bluetooth

def createFile(path,patient,file_type):
    try:
        time = datetime.now().strftime("%d%m%Y-%H-%M-%S")
        file_path = path+"/"+patient.name+"_"+time+".csv"
        open(file_path, 'w+').close()
        return file_path
    except Exception as e:
        print("ERROR CREATING CSV DATA FILE!!")
        print(e)

#TODO
def createHeader(path,patient):
    return 0


def connectBluetooth(address,port=1):
    sock = bluetooth.BluetoothSocket(bluetooth.RFCOMM)
    sock.connect((address, port))

    return sock

def findBluetoothDevices(duration):
    nearby_devices = bluetooth.discover_devices(duration=duration,lookup_names=True)

    devices = ['Select a device']

    for addr, name in nearby_devices:
        devices.append(name+" | "+addr)

    return devices
