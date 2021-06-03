# This Python file uses the following encoding: utf-8

# if __name__ == "__main__":
#     pass
from transformers import AutoTokenizer, AutoModelForSequenceClassification, pipeline


def sentimentAnalyser(sentence):

    tokenizer = AutoTokenizer.from_pretrained("sagorsarker/bangla-bert-sentiment")

    model = AutoModelForSequenceClassification.from_pretrained("sagorsarker/bangla-bert-sentiment")

    nlp = pipeline('sentiment-analysis', model=model, tokenizer=tokenizer)

    output = nlp(sentence)

    if output[0]['score'] < 0.3 :
        return "neutral"
    elif output[0]['label'] == 'LABEL_1':
        return "positive"
    else:
        return "negative"
