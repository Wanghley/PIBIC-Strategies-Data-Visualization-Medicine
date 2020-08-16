import blue
import bluetooth
import time

def search():
    devices = blue.discover_devices(duration=20, lookup_names = True)
    return devices

def connect(address):
    port = 1
    sock = bluetooth.BluetoothSocket(bluetooth.RFCOMM)
    try:
        sock.connect((address, port))
        print('Conectado com sucesso!')
        return True
    except Exception as excp:
        print('ERRO!')
        print('Falha na conexão')
        print(excp.args)
        print(excp)
        sock.close()
        return False