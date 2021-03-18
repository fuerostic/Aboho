import bltk
import nltk
from bltk.langtools import Tokenizer
from bltk.langtools import PosTagger
from bltk.langtools.banglachars import (vowels,
                                        vowel_signs,
                                        consonants,
                                        digits,
                                        operators,
                                        punctuations,
                                        others)

from bltk.langtools import remove_stopwords

tokenizer  = Tokenizer()


#tokenizing function
def sentence_tokenize(text):
    sentences = tokenizer.sentence_tokenizer(text)
    return sentences

def word_tokenize(sentence):
    words = tokenizer.word_tokenizer(sentence)
    return words

#stop word removal function
def stop_words_removal(tokened_words ,level="moderate"):
    filtered_words = remove_stopwords(tokened_words,level=level)
    return filtered_words

#pos tagging
pos_tagger = PosTagger()
def pos_tagging(filtered_words):
    dict = {}
    for word in filtered_words:
        tag = pos_tagger.pos_tag(word)
        dict[word] = tag
    return  dict

#punctuation removal

def punct_removal(text):
    words = tokenizer.word_tokenizer(text)
    filtered = [word for word in words if word not in punctuations]
    filtered_text = " ".join(filtered)
    return filtered_text







