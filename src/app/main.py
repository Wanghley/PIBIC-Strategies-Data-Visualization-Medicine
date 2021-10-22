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

# import modules
import sys
import os

#import QT CORE
from qt_core import *

#import main window
from design.windows.main_window.ui_main_window import *

# main window
class MainWindow(QMainWindow):
    def __init__(self):
        super().__init__()

        self.setWindowTitle("Motion Sense")

        # setup main window
        self.ui = UI_MainWindow()
        self.ui.setup_ui(self)

        #EVENT EXAMPLE
        #Toggle button
        self.ui.toggle_button.clicked.connect(self.toggle_button)

        # show the application
        self.show()
    
    def toggle_button(self):
        menu_width = self.ui.left_menu.width() #get menu
        
        #check width
        width = 50
        if menu_width==50:
            width = 240
        
        # start animation
        self.animation = QPropertyAnimation(self.ui.left_menu,b"minimumWidth")
        self.animation.setStartValue(menu_width)
        self.animation.setEndValue(width)
        self.animation.setDuration(500) #ms
        self.animation.setEasingCurve(QEasingCurve.OutCirc)
        self.animation.start()

if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = MainWindow()
    sys.exit(app.exec())