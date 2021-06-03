# This Python file uses the following encoding: utf-8

# if __name__ == "__main__":
#     pass

from summarizer import Summarizer
import easygui


def summarizer(paragraph):
    print("Started")
    model = Summarizer()
    result = model(paragraph, min_length=20)
    summary = "".join(result)
    print("end")
    return summary

def openFile():
        file = easygui.fileopenbox()
        print(file)
        texts = []
        f = open(file,"r",encoding = "utf8")

        lines = f.readlines()

        f.close()

        str = "".join(lines)

        return str





