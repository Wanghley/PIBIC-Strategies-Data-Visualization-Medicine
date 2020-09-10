from time import sleep
import threads as th
import data_structure as ds
import bluetooth
import patient

if __name__ == "__main__":
    file_path=''
    print('name of subject:')
    name = input()
    print('sex:')
    sex=input()
    print('birthday:')
    birthday=input() # MM/DD/YYYY

    p = patient.Patient(name,sex,birthday)

    try:
        file_path = "{}.csv".format(p.name)
        open(file_path, 'w+').close()
    except:
        print("ERROR CREATING CSV DATA FILE!!")

    print ("\n"+"-"*50+"\nStarting in 1 seconds...")
    sleep(1)
    print ("Running")

    # bluetooth configuration
    # ===================
    #bd_addr = "98:D3:31:FB:0F:F0" # hc05 parkinson 2
    bd_addr = "00:18:E4:40:00:06"
    # bd_addr =  "98:D3:31:F5:37:B0"
    port = 1
    sock = bluetooth.BluetoothSocket(bluetooth.RFCOMM)

    sock.connect((bd_addr, port))
    print('Connected')
        # send s to start the communication or 's' if python 2

    #HOST = ''
    #PORT = 2001
    BUFFER_SIZE = 60 # Testing...
    # s = socket(AF_INET, SOCK_STREAM)
    # s.setsockopt(SOL_SOCKET, SO_REUSEADDR, 1)
    # s.bind((HOST, PORT))
    # s.listen(1)

    # imp.reload(ds)
    # Create ring buffer
    data_buffer = ds.RingBuffer(BUFFER_SIZE)

    # imp.reload(th)
    st = th.BluetoothAcquisitionThread(data_buffer, sock, True)
    pt = th.DataSavingThread(data_buffer, p, file_path, True)

    st.start()
    pt.start()