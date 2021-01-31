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

def createHeader(path,patient):
    return 0

def connectBluetooth(address,port):
    sock = bluetooth.BluetoothSocket(bluetooth.RFCOMM)
    sock.connect((address, port))

    return sock

