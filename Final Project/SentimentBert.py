# This Python file uses the following encoding: utf-8

# if __name__ == "__main__":
#     pass
from transformers import AutoTokenizer, AutoModelForSequenceClassification, pipeline
from bendeep import sentiment

model_path = "senti_trained.pt"
vocab_path = "vocab.txt"


def sentimentAnalyser(sentence):

#    tokenizer = AutoTokenizer.from_pretrained("sagorsarker/bangla-bert-sentiment")

#    model = AutoModelForSequenceClassification.from_pretrained("sagorsarker/bangla-bert-sentiment")

#    nlp = pipeline('sentiment-analysis', model=model, tokenizer=tokenizer)

    output = sentiment.analyze(model_path, vocab_path, sentence)
    #print("output is" + output)

    if output == "negative" :
        return "নেতিবাচক "

    else:
        return "ইতিবাচক"
