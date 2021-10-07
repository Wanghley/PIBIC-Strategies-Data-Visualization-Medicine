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

        #-------------------------------------------------------------------------------------------------
        # MAIN WIDGET AND CHILDREN
        #-------------------------------------------------------------------------------------------------
        #create central widget
        self.central_frame = QFrame()
        self.central_frame.setStyleSheet("background-color: #282a36")

        #Create main layout
        self.main_layout = QHBoxLayout(self.central_frame) # fill all the area of the frame in an horizontal layout (X | X)
        self.main_layout.setContentsMargins(0,0,0,0) # remove borders around left menu and content layout
        self.main_layout.setSpacing(0) # remove borders between left menu and content layout

        # Left menu
        self.left_menu = QFrame()
        self.left_menu.setStyleSheet("background-color: #44475a")
        self.left_menu.setMaximumWidth(50) #change maximum width of left menu to 50px
        self.left_menu.setMinimumWidth(50)

        #-------------------------------------------------------------------------------------------------
        # CONTENT WIDGET & CHILDREN
        #-------------------------------------------------------------------------------------------------
        # content
        self.content = QFrame()
        self.content.setStyleSheet("background-color: #282a36")

        # content layout
        self.content_layout = QVBoxLayout(self.content)
        self.content_layout.setContentsMargins(0,0,0,0) 
        self.content_layout.setSpacing(0)

        ######################
        # TOP BAR 
        self.top_bar = QFrame()
        self.top_bar.setMinimumHeight(30) # Always set minimum anx maximum height to stay responsible
        self.top_bar.setMaximumHeight(30)
        self.top_bar.setStyleSheet("background-color:#21232d; color:#6272a4")
        self.top_bar.layout = QHBoxLayout(self.top_bar)
        self.top_bar.layout.setContentsMargins(10,0,10,0)
        # left label
        self.top_label_left = QLabel("MotionSense — Movements data center")
        #top spacer
        self.top_space = QSpacerItem(20,20,QSizePolicy.Expanding, QSizePolicy.Minimum)
        #right top label
        self.top_label_right = QLabel("Main page | NOT CONNECTED")
        self.top_label_right.setStyleSheet("font: 700 9pts 'Segoe UI'")
        ## add to top bar
        self.top_bar.layout.addWidget(self.top_label_left)
        self.top_bar.layout.addItem(self.top_space)
        self.top_bar.layout.addWidget(self.top_label_right)

        ######################


        # Application pages
        self.pages = QStackedWidget() # used to create page inside of the application
        self.pages.setStyleSheet("background-color:; font-size: 12pt; color: #f8f8f2")

        # botton bar
        self.botton_bar = QFrame()
        self.botton_bar.setMinimumHeight(30) # Always set minimum anx maximum height to stay responsible
        self.botton_bar.setMaximumHeight(30)
        self.botton_bar.setStyleSheet("background-color:#21232d; color:#6272a4")

        # add widgets to layout
        self.content_layout.addWidget(self.top_bar)
        self.content_layout.addWidget(self.pages)
        self.content_layout.addWidget(self.botton_bar)
        #-------------------------------------------------------------------------------------------------
        # add widgets to app
        self.main_layout.addWidget(self.left_menu)
        self.main_layout.addWidget(self.content)

        # Set central widget
        parent.setCentralWidget(self.central_frame)