import sys
import os

from PyQt5.QtWidgets import QApplication, QWidget
from PyQt5.QtCore import Qt
from PyQt5 import QtBluetooth

class bluetoothTest(QWidget):

    def __init__(self, parent = None):
        super(bluetoothTest, self).__init__(parent)
        self.connectToRobot()
        self.win = QWidget()
        self.win.show()

    def connectToRobot(self):
        self.sock = QtBluetooth.QBluetoothSocket(QtBluetooth.QBluetoothServiceInfo.RfcommProtocol)

        self.sock.connected.connect(self.connectedToBluetooth)
        self.sock.readyRead.connect(self.receivedBluetoothMessage)
        self.sock.disconnected.connect(self.disconnectedFromBluetooth)
        self.sock.error.connect(self.socketError)
        port = 1
        self.sock.connectToService(QtBluetooth.QBluetoothAddress("98:D3:C1:FD:2C:46"),port)

    def socketError(self,error):
        print(self.sock.errorString())

    def connectedToBluetooth(self):
        self.sock.write('A'.encode())

    def disconnectedFromBluetooth(self):
        self.print('Disconnected from bluetooth')

    def receivedBluetoothMessage(self):
        while self.sock.canReadLine():
            line = self.sock.readLine()
            print(str(line, "utf-8"))

def main():
    # deal with a bluetooth bug on mac
    if sys.platform == 'darwin':
        os.environ['QT_EVENT_DISPATCHER_CORE_FOUNDATION'] = '1'

    app = QApplication(sys.argv)
    ex = bluetoothTest()
    sys.exit(app.exec_())

if __name__ == '__main__':
        main()