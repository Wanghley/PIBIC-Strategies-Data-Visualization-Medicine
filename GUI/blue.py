import bluetooth
import time

sock = None

def search():
    devices = bluetooth.discover_devices(duration=20, lookup_names = True)
    return devices

def connect(device):
    global sock
    address = device.split('-')[1]
    # print(address)
    port = 1
    sock = bluetooth.BluetoothSocket(bluetooth.RFCOMM)
    try:
        sock.connect((address, port))
        # print('Conectado com sucesso!')
        return True
    except Exception as excp:
        print('ERRO!')
        print('Falha na conexão')
        print(excp.args)
        print(excp)
        sock.close()
        return False
def disconnect():
    global sock
    sock.close()