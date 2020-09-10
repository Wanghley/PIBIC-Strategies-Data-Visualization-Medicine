from threading import Thread, Event
from time import sleep, time
from datetime import datetime, timedelta
import csv

class BluetoothAcquisitionThread(Thread):

  def __init__(self, data_buffer, socket, print_data=False):
    print('Creating bluetooth data receiving thread')
    # Class attributes
    self.data_buffer = data_buffer  # Data storage
    self.socket = socket  # Communication
    # Control print data
    self.print_data = print_data

    # Base class constructor
    Thread.__init__(self, name='getDataThread')

  def run(self):
      print('Starting bluetooth data receiving thread...1s...')
      # send s to start the communication or 's' if python 2
      s = input()

      self.socket.sendall(s.encode('ASCII'))
      data = ''
      try:
          while True:  
            data += self.socket.recv(64).decode('ASCII')
            # FIXME: 
            # Data is appending somehow and the ok string is repeating
            if '#' in data:
              if self.print_data:
                print('\nReceived data: %s' % data) 
              data = data.split('#',1)
              data1 = data[0]
              data = data[1]
              if data1 == 'ok':
                self.socket.sendall('c')
                data = ''
                data1 = ''
              elif ((data1 == 'stop') or ('stop' in data)):
                break
              if len(data1) > 3:
                # if self.print_data:
                    # print('-'*10, 'bluetooth data receiving thread received\n> ', data1)
                # Atomic operation: write data to buffer
                self.data_buffer.lock()
                self.data_buffer.write(data1)
                self.data_buffer.unlock()
                data1=''

            sleep(1)
          self.socket.close()
      except Exception as inst:
          print(type(inst))
          print(inst.args)
          print(inst)
          print('Erro')
          self.socket.close()

      finally:
          print('Data buffer was closed')
          # Atomic operation: close data buffer
          self.data_buffer.lock()
          self.data_buffer.close()
          print(self.data_buffer.getLength())  # Final state of buffer
          self.data_buffer.unlock()
          self.socket.close()

  # Dados recebidos pelo BT do arduino
  # def btData(self):
  #   s = str(datetime.now()) + '#0,0,0,1,1,1,25#'
  #   return s

class DataSavingThread(Thread):

  def __init__(self, data_buffer, patient, file_path, print_data=False,  header=['time','accx','accy','accz','gyx','gyy','gyz','temp']):

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
    self._header=header

    Thread.__init__(self, name='dataSavingThread')

  def run(self):
    print('Starting DataSavingThread...')
    sleep(10)  # TODO: Rever
    while True:
      # File name section
      if self.file_name_flag == 0:
        self.file_start_time = str(datetime.now().isoformat(sep=' ', timespec='milliseconds'))
        if self.print_data:
          print(self.file_start_time)
        with open(self._file_path, 'a') as csvfile:
          writer = csv.writer(csvfile)
          
          writer.writerow([self.file_start_time])
          writer.writerow(['name:'+self.patient.name, 'sex:'+self.patient.sex,
              'birthday:'+self.patient.birthday])
          writer.writerow(self._header)

        self.file_name_flag = 1
      #
      # Check if buffer is closed
      self.data_buffer.lock()
      if self.data_buffer.isClosed():
        # Unlock data buffer
        self.data_buffer.unlock()
        print("Break DataSavingThread")
        break
      # If not, check if there is data to be read
      if self.data_buffer.getLength() != 0:
        # Update data in ring buffer
        data_tmp = self.data_buffer.read()
        if self.print_data:
          l_buffer = self.data_buffer.getLength()
        self.data_buffer.unlock()
        if self.print_data:
          print ('-'*10,'\nLength Data Buffer > ',l_buffer,'\n-','-'*10)
        # n_packets = data_tmp.count('#')/2
        # status_data_format = self.checkDataFormat(n_packets, data_tmp)
        # if status_data_format:# If data format ok
        #   data_tmp = data_tmp.split('#')
        
        self.writeCSV(data_tmp)
      sleep(1)

  def changeFileName(self):
    self.file_name_flag = 0

  def writeCSV(self, data):
    if self.print_data:
      print("DataSavingThread > ", data)
    with open(self._file_path, 'a') as csvfile:
      writer = csv.writer(csvfile)
      data = data.split(',')
      
      writer.writerow([data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7]])