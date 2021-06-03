# This Python file uses the following encoding: utf-8

# if __name__ == "__main__":
#     pass

import matplotlib.pyplot as plt
from wordcloud import WordCloud
from bnlp.corpus import stopwords
from bnlp.corpus.util import remove_stopwords

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

    wc.generate(text)
    wc.to_file('wc_output.png')

    return 'wc_output.png'
