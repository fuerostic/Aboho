# This Python file uses the following encoding: utf-8

# if __name__ == "__main__":
#     pass

import matplotlib.pyplot as plt
from wordcloud import WordCloud
from bnlp.corpus import stopwords
from bnlp.corpus.util import remove_stopwords

import time



def cloudGenerate(text):
    rgx = r"[\u0980-\u09FF]+"
    wc = WordCloud(
        background_color='white',
        stopwords=stopwords,
        height=600,
        width=400,
        font_path='kalpurush.ttf',
        regexp=rgx
    )

    t = time.localtime()
    current_time = time.strftime("%H_%M_%S", t)

    wc.generate(text)
    source = "outputs/" + current_time +'.png'
    wc.to_file(source)

    return source
