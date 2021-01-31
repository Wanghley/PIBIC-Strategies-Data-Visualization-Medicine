from threading import Thread, Event
from time import sleep, time
from datetime import datetime, timedelta
import csv


class BluetoothAcquisitionThread(Thread):

    def __init__(self, data_buffer, sock, print_data=False):
        print('Creating data receiving thread')
        # Class attributes
        self.data_buffer = data_buffer  # Data storage
        self.socket = sock  # Communication
        # Control print data
        self.print_data = print_data

        # Base class constructor
        Thread.__init__(self, name='getDataThread')

    def run(self):
        print('Data receiving started successfully!\nWainting for 3 way handshake...')

        s = input()
        self.socket.sendall(s.encode('ASCII'))
        data = ''

        try:
            while(True):
                data += self.socket.recv(64).decode('ASCII')
                if 'stop' in data:
                    print(data)
                    data = data.split('#', 1)
                    data1 = data[0]
                    data = data[1]
                    if data1 == 'ok':
                      self.socket.sendall('c')
                    elif len(data1) > 4:  # code of control to do not save ok junk data
                        if self.print_data:
                            print('%s' % data1)
                        if self.print_data:
                            print('data receiving> ', data1)
                        # Atomic operation: write data to buffer
                        self.data_buffer.lock()
                        self.data_buffer.write(data1)
                        self.data_buffer.unlock()
                    break
                      

                elif '#' in data:
                    data = data.split('#', 1)
                    data1 = data[0]
                    data = data[1]
                    
                    if data1 == 'ok':
                        self.socket.sendall('c')
                    elif len(data1) > 4:  # code of control to do not save ok junk data
                        if self.print_data:
                            print('%s' % data1)
                        if self.print_data:
                            print('data receiving> ', data1)
                        # Atomic operation: write data to buffer
                        self.data_buffer.lock()
                        self.data_buffer.write(data1)
                        self.data_buffer.unlock()

        except Exception as exc:
            print(type(exc))
            print(exc.args)
            print(exc)
            self.socket.close()
        finally:
            # Atomic operation: close data buffer
            self.data_buffer.lock()
            self.data_buffer.close()
            if self.print_data:
                print('Data receiving finished!')
                print(self.data_buffer.getLength())  # Final state of buffer
            self.data_buffer.unlock()
            self.socket.close()


class DataSavingThread(Thread):
    def __init__(self, data_buffer, patient, file_path, print_data=False,  header=['time', 'accx', 'accy', 'accz', 'gyx', 'gyy', 'gyz', 'temp']):
        print('Creating Data Saving Thread')
        # Data buffer
        self.data_buffer = data_buffer
        # Control print data
        self.print_data = print_data
        # File name vars
        self.file_name_flag = 0
        # Time elapse to change file name
        self._file_path = file_path
        self.patient = patient
        self._header = header

        Thread.__init__(self, name='savingThread')

    def run(self):
        if self.print_data:
            print('Data saving started successfully!')
        self.file_start_time = str(datetime.now().isoformat(
            sep=' ', timespec='milliseconds'))

        with open(self._file_path, 'a') as csvfile:
            writer = csv.writer(csvfile)
            writer.writerow([self.file_start_time])
            writer.writerow(['name:'+self.patient.name, 'sex:'+self.patient.sex,
                             'birthday:'+self.patient.birthday])
            writer.writerow(self._header)
            csvfile.close()
        if self.print_data:
            print('header saved successfully!\nStarting time: ' +
                  str(self.file_start_time))

        while True:
            # Check if buffer is closed
            # FIXME the code is not goin' into this if clause
            self.data_buffer.lock()
            if self.data_buffer.isClosed():
                # Unlock data buffer
                self.data_buffer.unlock()
                print("Saving finished and closed!")
                break

            leng = self.data_buffer.getLength()
            if leng != 0:
                # Update data in ring buffer
                data_tmp = self.data_buffer.readAll()
                l_buffer = -1
                if self.print_data:
                    l_buffer = self.data_buffer.getLength()
                self.data_buffer.unlock()
                if self.print_data:
                    print('-'*10, '\nLength Data Buffer > ',
                          l_buffer, '\n-', '-'*10)
                self.writeAllCSV(data_tmp)
            else:
                self.data_buffer.unlock()
            sleep(0.001)

    def changeFileName(self):
        self.file_name_flag = 0

    def writeCSV(self, data):
        if self.print_data:
            print("DataSavingThread > ", data)
        with open(self._file_path, 'a') as csvfile:
            writer = csv.writer(csvfile)
            data = data.split(',')
            writer.writerow([data[0], data[1], data[2], data[3],
                             data[4], data[5], data[6], data[7]])

    def writeAllCSV(self, data):
        with open(self._file_path, 'a') as csvfile:
            _writer = csv.writer(csvfile)
            _data = list(data)
            for i in range(len(_data)):
                _tmpdata = _data[i].split(',')
                _writer.writerow([_tmpdata[0], _tmpdata[1], _tmpdata[2], _tmpdata[3],
                                  _tmpdata[4], _tmpdata[5], _tmpdata[6], _tmpdata[7]])
