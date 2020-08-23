from PyQt5 import QtWidgets, uic, QtCore, QtGui
import sys
import blue as ble
import scripts as scpt
import patient

address = None
folder = None

#/////////////////////////////////////////////////////////////////////////////////////////////////
# Bluetooth Connection Dialog
class BluetoothConnect(QtWidgets.QDialog,uic.loadUiType('bluetooth_dialog.ui')[0]):
    def __init__(self, *args, **kwargs):
        super(BluetoothConnect, self).__init__(*args, **kwargs)
        self.setupUi(self)
        self.setWindowTitle("Conexão Dispositivo")

        list_of_devices = ble.search()
        # print(list_of_devices)
        names = ['Selecione']
        for device in list_of_devices:
            names.append(device[1]+"-"+device[0])

        # print(names)

        self.cbDevices = self.findChild(QtWidgets.QComboBox,'cbOptions')
        self.cbDevices.addItems(names)

        self.btnCancel = self.findChild(QtWidgets.QPushButton,'btnCancel')
        self.btnCancel.clicked.connect(self.close)

        self.btnConnect = self.findChild(QtWidgets.QPushButton,'btnConnect')
        self.btnConnect.clicked.connect(self.connection)

    def connection(self):
        self.status=ble.connect(str(self.cbDevices.currentText()))
        if self.status == True:
            QtWidgets.QMessageBox.information(self, 'Success', 'Conectado com sucesso!')
            global address
            address=str(self.cbDevices.currentText().split('-')[1])
            self.accept()
        else:
            print('wtf?')
    def get_output(self):
        return self.status
#/////////////////////////////////////////////////////////////////////////////////////////////////
# Main frame
class Main(QtWidgets.QMainWindow):
    def __init__(self):
        super(Main, self).__init__() # Call the inherited classes __init__ method
        uic.loadUi('style.ui', self) # Load the .ui file

        self.btnConnect = self.findChild(QtWidgets.QPushButton,'btnConnect')
        self.btnConnect.clicked.connect(
            self.connection)  # Remember to pass the definition/method, not the return value!

        self.lblBlue = self.findChild(QtWidgets.QLabel, 'lblBlue')

        self.btnSelectLocation = self.findChild(QtWidgets.QPushButton, 'btnSelectLocation')
        self.btnSelectLocation.clicked.connect(self.selectSaveLocation)

        self.lblFolder = self.findChild(QtWidgets.QLabel,'lblFolder')

        self.txtName = self.findChild(QtWidgets.QPlainTextEdit,'txtName')
        self.rbtnFemale = self.findChild(QtWidgets.QRadioButton,'rbtnFemale')
        self.rbtnMale = self.findChild(QtWidgets.QRadioButton,'rbtnMale')
        self.datePicker = self.findChild(QtWidgets.QDateEdit,'datePicker')

        self.btnPatientData = self.findChild(QtWidgets.QPushButton, 'btnPatientData')
        self.btnPatientData.clicked.connect(self.createDataFile)

        self.show() # Show the GUI

    def createDataFile(self):
        global folder
        if len(folder)==0:
            QtWidgets.QMessageBox.warning(self, 'Atenção', 'Selecione um lugar para salvar a coleta!')
        elif ((len(self.txtName.toPlainText())==0)|
        (not(self.rbtnFemale.isChecked()) and not(self.rbtnMale.isChecked()))):
            QtWidgets.QMessageBox.warning(self, 'Atenção', 'Todos os dados do paciente \ndevem ser preenchidos!')
        else:
            self.p1 = patient.Patient(self.txtName.toPlainText(), self.datePicker.date().toPyDate(), ('F' if self.rbtnFemale.isChecked() else 'M'))

            file = scpt.CreateFile(folder,self.p1)
            if(file.run()):
                QtWidgets.QMessageBox.information(self, 'SUCESSO', 'Arquivo pronto para\niniciar coleta')
            else:
                QtWidgets.QMessageBox.critical(self, 'ERRO', 'Problema ao criar arquivo!')

    def selectSaveLocation(self):
        global folder
        self.folder = str(QtWidgets.QFileDialog.getExistingDirectory(self, "Select Directory"))
        if len(self.folder)>0:
            self.lblFolder.setText(self.folder)
        folder = self.folder
    

    def connection(self):
        if self.btnConnect.text()=='Conectar':
            dlg = BluetoothConnect(self)
            if dlg.exec_():
                self.status = dlg.get_output()
            else:
                print("Canceled")
        else:
            ble.disconnect()
            self.status=False
        self.connectedIconChanger(self.status)
    
    def connectedIconChanger(self,status):
        if status:
            pixmap = QtGui.QPixmap('./images/bluetooth_connected.png')
            self.lblBlue.setPixmap(pixmap)
            self.btnConnect.setText('Desconectar')
        else:
            pixmap = QtGui.QPixmap('./images/bluetooth.png')
            self.lblBlue.setPixmap(pixmap)
            self.btnConnect.setText('Conectar')   
#/////////////////////////////////////////////////////////////////////////////////////////////////

app = QtWidgets.QApplication(sys.argv) # Create an instance of QtWidgets.QApplication
window = Main() # Create an instance of our class
app.exec_() # Start the application