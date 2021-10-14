# -*- coding: utf-8 -*-

################################################################################
## Form generated from reading UI file 'pagesTuBZFp.ui'
##
## Created by: Qt User Interface Compiler version 5.15.2
##
## WARNING! All changes made in this file will be lost when recompiling UI file!
################################################################################

from qt_core import *


class Ui_application_pages(object):
    def setupUi(self, application_pages):
        if not application_pages.objectName():
            application_pages.setObjectName(u"application_pages")
        application_pages.resize(699, 410)
        self.main = QWidget()
        self.main.setObjectName(u"main")
        self.verticalLayout = QVBoxLayout(self.main)
        self.verticalLayout.setObjectName(u"verticalLayout")
        self.horizontalLayout_2 = QHBoxLayout()
        self.horizontalLayout_2.setObjectName(u"horizontalLayout_2")
        self.verticalLayout_9 = QVBoxLayout()
        self.verticalLayout_9.setObjectName(u"verticalLayout_9")
        self.verticalLayout_9.setSizeConstraint(QLayout.SetMinAndMaxSize)
        self.verticalLayout_9.setContentsMargins(10, 10, 10, 10)
        self.verticalSpacer_2 = QSpacerItem(80, 40, QSizePolicy.Minimum, QSizePolicy.Expanding)

        self.verticalLayout_9.addItem(self.verticalSpacer_2)

        self.label = QLabel(self.main)
        self.label.setObjectName(u"label")
        self.label.setMaximumSize(QSize(900, 16777214))
        self.label.setAlignment(Qt.AlignCenter)
        self.label.setPixmap(QPixmap(u"src/app/design/images/white_logo.png").scaledToWidth(400))

        self.verticalLayout_9.addWidget(self.label)

        self.verticalSpacer_3 = QSpacerItem(50, 40, QSizePolicy.Minimum, QSizePolicy.Expanding)

        self.verticalLayout_9.addItem(self.verticalSpacer_3)

        self.pushButton_2 = QPushButton(self.main)
        self.pushButton_2.setObjectName(u"pushButton_2")
        self.pushButton_2.setMaximumSize(QSize(10000, 80))

        self.verticalLayout_9.addWidget(self.pushButton_2)

        self.pushButton_3 = QPushButton(self.main)
        self.pushButton_3.setObjectName(u"pushButton_3")
        self.pushButton_3.setMaximumSize(QSize(10000, 16777215))

        self.verticalLayout_9.addWidget(self.pushButton_3)

        self.pushButton = QPushButton(self.main)
        self.pushButton.setObjectName(u"pushButton")
        self.pushButton.setMaximumSize(QSize(10000, 16777215))

        self.verticalLayout_9.addWidget(self.pushButton)

        self.pushButton_4 = QPushButton(self.main)
        self.pushButton_4.setObjectName(u"pushButton_4")

        self.verticalLayout_9.addWidget(self.pushButton_4)

        self.verticalSpacer = QSpacerItem(80, 40, QSizePolicy.Minimum, QSizePolicy.Expanding)

        self.verticalLayout_9.addItem(self.verticalSpacer)

        self.verticalLayout_9.setStretch(1, 10)
        self.verticalLayout_9.setStretch(4, 10)

        self.horizontalLayout_2.addLayout(self.verticalLayout_9)

        self.verticalLayout_8 = QVBoxLayout()
        self.verticalLayout_8.setObjectName(u"verticalLayout_8")
        self.verticalLayout_8.setSizeConstraint(QLayout.SetMinAndMaxSize)
        self.label_6 = QLabel(self.main)
        self.label_6.setObjectName(u"label_6")
        self.label_6.setMaximumSize(QSize(300, 60))
        self.label_6.setCursor(QCursor(Qt.IBeamCursor))
        self.label_6.setWordWrap(True)
        self.label_6.setMargin(10)

        self.verticalLayout_8.addWidget(self.label_6)

        self.label_7 = QLabel(self.main)
        self.label_7.setObjectName(u"label_7")
        self.label_7.setMaximumSize(QSize(16777215, 80))
        self.label_7.setWordWrap(True)
        self.label_7.setMargin(10)

        self.verticalLayout_8.addWidget(self.label_7)


        self.horizontalLayout_2.addLayout(self.verticalLayout_8)


        self.verticalLayout.addLayout(self.horizontalLayout_2)

        application_pages.addWidget(self.main)
        self.patient_form = QWidget()
        self.patient_form.setObjectName(u"patient_form")
        self.verticalLayout_2 = QVBoxLayout(self.patient_form)
        self.verticalLayout_2.setObjectName(u"verticalLayout_2")
        self.label_2 = QLabel(self.patient_form)
        self.label_2.setObjectName(u"label_2")
        self.label_2.setAlignment(Qt.AlignCenter)

        self.verticalLayout_2.addWidget(self.label_2)

        application_pages.addWidget(self.patient_form)
        self.collect_page = QWidget()
        self.collect_page.setObjectName(u"collect_page")
        self.verticalLayout_3 = QVBoxLayout(self.collect_page)
        self.verticalLayout_3.setObjectName(u"verticalLayout_3")
        self.label_3 = QLabel(self.collect_page)
        self.label_3.setObjectName(u"label_3")
        self.label_3.setAlignment(Qt.AlignCenter)

        self.verticalLayout_3.addWidget(self.label_3)

        application_pages.addWidget(self.collect_page)
        self.visualization_page = QWidget()
        self.visualization_page.setObjectName(u"visualization_page")
        self.verticalLayout_4 = QVBoxLayout(self.visualization_page)
        self.verticalLayout_4.setObjectName(u"verticalLayout_4")
        self.label_4 = QLabel(self.visualization_page)
        self.label_4.setObjectName(u"label_4")
        self.label_4.setAlignment(Qt.AlignCenter)

        self.verticalLayout_4.addWidget(self.label_4)

        application_pages.addWidget(self.visualization_page)
        self.settings_page = QWidget()
        self.settings_page.setObjectName(u"settings_page")
        self.verticalLayout_5 = QVBoxLayout(self.settings_page)
        self.verticalLayout_5.setObjectName(u"verticalLayout_5")
        self.label_5 = QLabel(self.settings_page)
        self.label_5.setObjectName(u"label_5")
        self.label_5.setAlignment(Qt.AlignCenter)

        self.verticalLayout_5.addWidget(self.label_5)

        application_pages.addWidget(self.settings_page)

        self.retranslateUi(application_pages)

        QMetaObject.connectSlotsByName(application_pages)
    # setupUi

    def retranslateUi(self, application_pages):
        application_pages.setWindowTitle(QCoreApplication.translate("application_pages", u"StackedWidget", None))
        self.label.setText("")
        self.pushButton_2.setText(QCoreApplication.translate("application_pages", u"PushButton", None))
        self.pushButton_3.setText(QCoreApplication.translate("application_pages", u"PushButton", None))
        self.pushButton.setText(QCoreApplication.translate("application_pages", u"PushButton", None))
        self.pushButton_4.setText(QCoreApplication.translate("application_pages", u"PushButton", None))
        self.label_6.setText(QCoreApplication.translate("application_pages", u"This project is entirely built with QT for open source projects.", None))
        self.label_7.setText(QCoreApplication.translate("application_pages", u"For commercial use you should be aware of the regulamentations of QT in their website.", None))
        self.label_2.setText(QCoreApplication.translate("application_pages", u"Patient form", None))
        self.label_3.setText(QCoreApplication.translate("application_pages", u"Collection Page", None))
        self.label_4.setText(QCoreApplication.translate("application_pages", u"Visualization Page", None))
        self.label_5.setText(QCoreApplication.translate("application_pages", u"Settings page", None))
    # retranslateUi

