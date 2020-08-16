from PyQt5 import QtWidgets, uic, QtCore
import sys
import blue as ble

class BluetoothConnect(QtWidgets.QDialog,uic.loadUiType('bluetooth_dialog.ui')[0]):
    def __init__(self, *args, **kwargs):
        super(BluetoothConnect, self).__init__(*args, **kwargs)
        self.setupUi(self)
        self.setWindowTitle("Conexão Dispositivo")

        devices = ble.search()
        self.cbDevices = self.findChild(QtWidgets.QComboBox,'cbOptions')
        self.cbDevices.addItems(devices)

        self.btnCancel = self.findChild(QtWidgets.QPushButton,'btnCancel')
        self.btnCancel.clicked.connect(self.close)




class Main(QtWidgets.QMainWindow):
    def __init__(self):
        super(Main, self).__init__() # Call the inherited classes __init__ method
        uic.loadUi('style.ui', self) # Load the .ui file

        self.btnConnect = self.findChild(QtWidgets.QPushButton,'btnConnect')
        self.btnConnect.clicked.connect(
            self.connection)  # Remember to pass the definition/method, not the return value!


        self.show() # Show the GUI

    def connection(self):
        dlg = BluetoothConnect(self)
        if dlg.exec_():
            print("Success!")
        else:
            print("Cancel!")


app = QtWidgets.QApplication(sys.argv) # Create an instance of QtWidgets.QApplication
window = Main() # Create an instance of our class
app.exec_() # Start the application