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

# import pages
from pages.ui_pages import *

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

        #-------------------------------------------------------------------------------------------------
        # LEFT MENU
        self.left_menu = QFrame()
        self.left_menu.setStyleSheet("background-color: #44475a")
        self.left_menu.setMaximumWidth(50) #change maximum width of left menu to 50px
        self.left_menu.setMinimumWidth(50)

        # left menu layout
        self.left_menu_layout = QVBoxLayout(self.left_menu)
        self.left_menu_layout.setContentsMargins(0,0,0,0)
        self.left_menu_layout.setSpacing(0)

        # top frame menu
        self.left_menu_top_frame = QFrame()
        self.left_menu_top_frame.setMinimumHeight(50)
        self.left_menu_top_frame.setStyleSheet("background-color: red")

        # menu spacer
        self.left_menu_spacer = QSpacerItem(20,20,QSizePolicy.Minimum, QSizePolicy.Expanding)

        # top frame menu
        self.left_menu_botton_frame = QFrame()
        self.left_menu_botton_frame.setMinimumHeight(50)
        self.left_menu_botton_frame.setStyleSheet("background-color: red")

        # label version
        self.left_menu_label_version = QLabel("v0.1.0")
        self.left_menu_label_version.setAlignment(Qt.AlignCenter)
        self.left_menu_label_version.setMinimumHeight(30)
        self.left_menu_label_version.setMaximumHeight(30)
        self.left_menu_label_version.setStyleSheet("font: 400 9pts 'Segoe UI'; font-size:12px; color: #a2b3e8")

        self.left_menu_layout.addWidget(self.left_menu_top_frame)
        self.left_menu_layout.addItem(self.left_menu_spacer)
        self.left_menu_layout.addWidget(self.left_menu_botton_frame)
        self.left_menu_layout.addWidget(self.left_menu_label_version)


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
        self.top_label_right.setStyleSheet("font: 600 9pts 'Segoe UI'; font-size:14px")
        ## add to top bar
        self.top_bar.layout.addWidget(self.top_label_left)
        self.top_bar.layout.addItem(self.top_space)
        self.top_bar.layout.addWidget(self.top_label_right)

        ######################


        # Application pages
        self.pages = QStackedWidget() # used to create page inside of the application
        self.pages.setStyleSheet("font-size: 12pt; color: #f8f8f2")
        self.ui_pages = Ui_application_pages()
        self.ui_pages.setupUi(self.pages)
        self.pages.setCurrentWidget(self.ui_pages.main)

        ######################
        # BOTTON BAR
        self.botton_bar = QFrame()
        self.botton_bar.setMinimumHeight(30) # Always set minimum anx maximum height to stay responsible
        self.botton_bar.setMaximumHeight(30)
        self.botton_bar.setStyleSheet("background-color:#21232d; color:#6272a4")
        self.botton_bar_layout = QHBoxLayout(self.botton_bar)
        self.botton_bar_layout.setContentsMargins(10,0,10,0)
        # left label
        self.botton_label_left = QLabel("Created by <b>Wanghley Soares Martins</b> & adviced by PhD <b>Fábio Henrique Monteiro Oliveira</b>")
        self.botton_label_left.setStyleSheet("font: 200;font-size:12px;text-decoration: none")
        #top spacer
        self.botton_space = QSpacerItem(20,20,QSizePolicy.Expanding, QSizePolicy.Minimum)
        #right top label
        self.botton_label_right = QLabel("Copyright© 2021")
        self.botton_label_right.setStyleSheet("font: 400;font-size:12px;text-decoration: none")
        ## add to top bar
        self.botton_bar_layout.addWidget(self.botton_label_left)
        self.botton_bar_layout.addItem(self.botton_space)
        self.botton_bar_layout.addWidget(self.botton_label_right)
        ######################

        # add widgets to layout
        self.content_layout.addWidget(self.top_bar)
        self.content_layout.addWidget(self.pages)
        self.content_layout.addWidget(self.botton_bar)
        #-----------------------------------------------------------------------------------------------
        # add widgets to app
        self.main_layout.addWidget(self.left_menu)
        self.main_layout.addWidget(self.content)

        # Set central widget
        parent.setCentralWidget(self.central_frame)