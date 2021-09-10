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

        #create central widget
        self.central_frame = QFrame()
        self.central_frame.setStyleSheet("background-color: #282a36")

        #Create main layout
        self.main_layout = QHBoxLayout(self.central_frame) # fill all the area of the frame in an horizontal layout (X | X)
        self.main_layout.setContentsMargins(0,0,0,0) # remove borders around left menu and content layout
        self.main_layout.setSpacing(0) # remove borders between left menu and content layout

        # Lef menu
        self.left_menu = QFrame()
        self.left_menu.setStyleSheet("background-color: #44475a")
        self.left_menu.setMaximumWidth(50) #change maximum width of left menu to 50px

        # content
        self.content = QFrame()
        self.content.setStyleSheet("background-color: #282a36")


        # add widgets to app
        self.main_layout.addWidget(self.left_menu)
        self.main_layout.addWidget(self.content)

        # Set central widget
        parent.setCentralWidget(self.central_frame)