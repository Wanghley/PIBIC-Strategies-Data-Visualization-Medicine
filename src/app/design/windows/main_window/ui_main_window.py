# ///////////////////////////////////////////////////////////////
#
# BY: WANGHLEY SOARES MARTINS
# BASED ON: WANDERSON M. PIMENTA WORK
# PROJECT MADE WITH: Qt Designer and PySide6
#
# There are limitations on Qt licenses if you want to use your products
# commercially, I recommend reading them on the official website:
# https://doc.qt.io/qtforpython/licenses.html
#
# ///////////////////////////////////////////////////////////////

#import QT CORE
from qt_core import *

# main window
class UI_MainWindow(object):
    def setup_ui(self,parent):
        if not parent.objectName():
            parent.setObjectName("MainWindow")
        
        # set initial parameters
        parent.resize(960,540) # initial size
        parent.setMinimumSize(650,400) #minimun size