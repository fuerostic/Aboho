from sys import getdefaultencoding

import setdefaultencoding
from gensim.models import Word2Vec
from bltk.langtools import PosTagger
import nltk
import bltk
import numpy as np
from bltk.langtools import Tokenizer
from sklearn.cluster import KMeans
from sklearn import  cluster
from sklearn import metrics
from sklearn.decomposition import PCA
from scipy.cluster import hierarchy
from sklearn.cluster import AgglomerativeClustering
import matplotlib.pyplot as plt



#text = input("Enter the sentence")

with open('file.txt','r',encoding='utf-8') as f:
    text = f.readlines()

tokenizer  = Tokenizer()

sentences = tokenizer.sentence_tokenizer(text)
print(sentences)


m = Word2Vec(sentences, size=50, min_count=1, sg=1)

def vectorizer(sent,m):
    vec = []
    numw =0

    for w in sent:
        try:
            if numw == 0:
                vec = m[w]
            else:
                vec = np.add(vec,m[w])
            numw+=1

        except:
            pass

        return np.asarray(vec) /numw

l = []
for i in sentences:
    l.append(vectorizer(i,m))
X = np.array(l)


#kmenas clustering

#elbow method
wcss = []
for i in range(1,4):
    kmeans = KMeans(n_clusters=i,init= 'k-means++', random_state=1)
    kmeans.fit(X)
    wcss.append(kmeans.inertia_)

plt.plot(range(1,4),wcss)
plt.title('The elbow method')
plt.xlabel('Number of clusters')
plt.ylabel('WCSS')
plt.show()


