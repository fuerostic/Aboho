# This Python file uses the following encoding: utf-8
import os
from pathlib import Path
import sys

from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QObject, Slot, Signal
from SummaryBert import summarizer


class MainWindow(QObject):
    def __init__(self):
        QObject.__init__(self)

    #set name
    getInput = Signal(str)
    #setSentiment = Signal(str)


    @Slot(str)
    def summaryCreate(self,text):
        print("start")

        #ascii_string = unicode_string.encode('ascii', 'ignore')

       # text = text.encode('ascii', 'ignore')

        summ = summarizer(text)
        #print(text)
        self.getInput.emit(summ)

#    def welcomeText(self,name):
#        self.setName.emit("welcome " + name)





if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    #get context
    print("Here 1")
    main = MainWindow()
    print("Here 2")
    engine.rootContext().setContextProperty("backend",main)
    print("Here 3")

    #load qml file
    engine.load(os.fspath(Path(__file__).resolve().parent / "qml/main.qml"))
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
