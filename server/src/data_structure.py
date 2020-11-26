from threading import RLock
from collections import deque

class RingBuffer:
  def __init__(self, max_length):
    self._max_length = max_length # Buffer size
    self._data = deque() # Data array
    self._closed = False # Buffer closed flag
    self._buffer_lock = RLock() # Mutex

    # Write dados to buffer (and removes first element)
  def write(self, dados):
    if len(self._data) == self._max_length: # Buffer is full, overwrite
      self._data.popleft()
    self._data.append(dados)

    # Read data in read pointer
  def read(self):
    return self._data.popleft()

  def readAll(self):
    _tmpdata=self._data.copy()
    self._data.clear()
    return _tmpdata

    # Open ring buffer
  def open(self):
    self._closed = False
    
# Close ring buffer
  def close(self):
    self._closed = True
    
# Return buffer status (true for buffer closed)
  def isClosed(self):
    return self._closed
    
# Return buffer data
  def getData(self):
    return self._data

# Return current buffer length
  def getLength(self):
    return len(self._data)

# Lock buffer (get buffer's mutex)
  def lock(self):
    self._buffer_lock.acquire()

# Unlock buffer (release buffer mutex)
  def unlock(self):
    self._buffer_lock.release()

# Return max buffer size
  def getMaxLength(self):
    return self._max_length