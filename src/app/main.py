# This Python file uses the encoding: utf-8
import sys
import os
from patient import Patient
import utils
import bluetooth
import time


from PySide2.QtCore import QObject, Slot, Signal
from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine

#Global variables
patient = None
path = ""
file_path = None
file_type = ".csv"
frequency = 50 #default frequency Hz
sock = None
address = None

def connectBluetooth(address,port=1):
    global sock
    sock = bluetooth.BluetoothSocket(bluetooth.RFCOMM)
    sock.connect((address, port))
    time.sleep(2)

# Control of Patient sign up screen
class PatientWindow(QObject):
    def __init__(self):
        QObject.__init__(self)
    
    #patient data configuration of signal receiving
    patientData = Signal(bool,str)

    #receive data from frontend
    @Slot(str,bool,bool,str,bool,bool,str)
    def savePatientData(self,name,female,male,birthday,parkinsonian_y,parkinsonian_n,path):
        error=""
        success = True
        if(len(name)<2):
            error = 'Name was not inserted'
            success = False
        if(path=="Select folder to save data..."):
            error = 'Path was not selected'
            success=False
        else:
            name=str(name)
            sex = "Female" if female else "Male"
            birthday=str(birthday)
            parkisonian = True if parkinsonian_y else False
            path = str(path)
            patient=Patient(name,birthday,sex,parkisonian)

            file_path = str(utils.createFile(path,patient,file_type))
            
        self.patientData.emit(success,error)

class SettingsWindow(QObject):
    def __init__(self):
        QObject.__init__(self)

    searchDeviceSig = Signal(list)

    connectToDevice = Signal(bool,str)

    @Slot()
    def searchDevice(self):
        listDevice = utils.findBluetoothDevices(5)
        print(listDevice)
        self.searchDeviceSig.emit(listDevice)

    @Slot(str)
    def connect(self,device):
        success = True
        print(device)
        name,addr = device.split('|')
        addr = addr.strip()
        name = name.strip()
        connectBluetooth(addr)
        if(sock==None):
            success=False
        address=addr
        self.connectToDevice.emit(success,name)

    

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    #Get Context
    patientWindow = PatientWindow()
    engine.rootContext().setContextProperty('save_patient',patientWindow)

    settingsWindow = SettingsWindow()
    engine.rootContext().setContextProperty('settings_backend',settingsWindow)

    #Load qml file
    engine.load(os.path.join(os.path.dirname(__file__), "qml/main.qml"))
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())