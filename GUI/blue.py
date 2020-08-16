import blue
import bluetooth
import time

def search():
    devices = blue.discover_devices(duration=20, lookup_names = True)
    return devices

def connect(address):
    port = 1
    sock = bluetooth.BluetoothSocket(bluetooth.RFCOMM)