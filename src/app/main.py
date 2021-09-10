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

        # show the application
        self.show()

if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = MainWindow()
    sys.exit(app.exec())