# This Python file uses the following encoding: utf-8
import os
from pathlib import Path
import sys

from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QObject, Slot, Signal
from SummaryBert import summarizer,openFile
from SentimentBert import sentimentAnalyser
from WordCloudGenerator import cloudGenerate
import  clipboard
import easygui


class MainWindow(QObject):
    def __init__(self):
        QObject.__init__(self)


    #set name
    getInput = Signal(str)
    copyText = Signal(str)
    openTxtFile = Signal(str)
    getSentimentInput = Signal(str)
    getWordCloudInput = Signal(str)
    #setSentiment = Signal(str)


    @Slot(str)
    def summaryCreate(self,text):
        print("start")

        #ascii_string = unicode_string.encode('ascii', 'ignore')

       # text = text.encode('ascii', 'ignore')

        summ = summarizer(text)
        #print(text)
        self.getInput.emit(summ)


    @Slot(str)
    def textCopy(self,text):
        clipboard.copy(text)
        self.getInput.emit("Copied to clipboard")


    @Slot(str)
    def fileOpen(self,param):
        file = easygui.fileopenbox()
        print(file)
        texts = []
        f = open(file,"r",encoding = "utf8")

        lines = f.readlines()

        f.close()


        input = "".join(lines)
        self.openTxtFile.emit(input)




    @Slot(str)
    def sentimentParsing(self, text):
        print("started")
        result = sentimentAnalyser(text)
        print(result)
        print("ended")
        self.getSentimentInput.emit(result)


    @Slot(str)
    def wordParsing(self,text):
        print("started")
        source = cloudGenerate(text)
        print("end")
        self.getWordCloudInput.emit(source)




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
