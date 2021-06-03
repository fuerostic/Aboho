# This Python file uses the following encoding: utf-8

# if __name__ == "__main__":
#     pass

from summarizer import Summarizer


def summarizer(paragraph):
    print("Started")
    model = Summarizer()
    result = model(paragraph, min_length=20)
    summary = "".join(result)
    print("end")
    return summary




