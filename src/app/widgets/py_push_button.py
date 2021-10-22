# ///////////////////////////////////////////////////////////////
#
# BY: WANGHLEY SOARES MARTINS
# ADVISOR: Ph.D. FÁBIO HENRIQUE MONTEIRO OLIVEIRA
# PROJECT MADE WITH: Qt Designer and PySide6
#
# There are limitations on Qt licenses if you want to use your products
# commercially, I recommend reading them on the official website:
# https://doc.qt.io/qtforpython/licenses.html
#
# ///////////////////////////////////////////////////////////////

import os
from qt_core import *


class PyPushButton(QPushButton):
    def __init__(self, text="", height=40, minimun_width=50, text_padding=55, text_color="#c3ccdf", icon_path="", icon_color="#c3ccdf", btn_color="#44475a", btn_hover="#4f5368", btn_pressed="#282a36", is_active=False):
        super().__init__()

        # set default parameters
        self.setText(text)
        self.setMaximumHeight(height)
        self.setMinimumHeight(height)
        self.setCursor(Qt.PointingHandCursor)

        # set custom parameters
        self.minimum_width = minimun_width
        self.text_padding = text_padding
        self.text_color = text_color
        self.icon_path = icon_path
        self.icon_color = icon_color
        self.btn_color = btn_color
        self.btn_hover = btn_hover
        self.btn_pressed = btn_pressed
        self.is_active = is_active

        self.setStyle(text_padding=self.text_padding, text_color=self.text_color, btn_color=self.btn_color,
                      btn_hover=self.btn_hover, btn_pressed=self.btn_pressed, is_active=self.is_active)

    def setStyle(self, text_padding=55, text_color="#c3ccdf", btn_color="#44475a", btn_hover="#4f5368", btn_pressed="#282a36", is_active=False):
        style = f"""
            QPushButton {{
                color:{text_color};
                background-color:{btn_color};
                padding-left:{text_padding}px;
                text-align: left;
                border: none;
            }}
            QPushButton:hover {{
                background-color: {btn_hover}
            }}
            QPushButton:pressed {{
                background-color: {btn_pressed}
            }}
        """

        active_style = f"""
            QPushButton {{
                background-color:{btn_hover};
                border-right: 5px solid #282a26
            }}
        """
        if not is_active:
            self.setStyleSheet(style)
        else:
            self.setStyleSheet(style+active_style)

    def paintEvent(self, event):
        # return default style
        QPushButton.paintEvent(self, event)

        # painter
        qp = QPainter()
        qp.begin(self)
        qp.setRenderHint(QPainter.Antialiasing)
        qp.setPen(Qt.NoPen)  # create a border, but we don't want borders

        rect = QRect(0, 0, self.minimum_width, self.height())

        self.draw_icon(qp, self.icon_path, rect, self.icon_color)

        qp.end()

    def draw_icon(self, qp, image, rect, color):
        # get folder of icons for any system
        if(len(image) > 1):
            app_path = os.path.abspath(os.getcwd())  # root of application
            folder_path = "src/app/design/icons"
            path = os.path.join(app_path, folder_path)
            icon_path = os.path.normpath(os.path.join(path, image))
            
            # Draw icon
            icon = QPixmap(icon_path)
            painter = QPainter(icon)
            painter.setCompositionMode(QPainter.CompositionMode_SourceIn)
            painter.fillRect(icon.rect(), color)
            qp.drawPixmap(
                (rect.width()-icon.width())/2,
                (rect.height()-icon.height())/2,
                icon
            )
            painter.end()
