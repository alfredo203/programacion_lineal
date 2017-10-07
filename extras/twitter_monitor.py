# ====================================
## Simple twitter extractor
## alfredo_203 / Alfredo Olguin
## Extra sources for text mining:

## https://www.researchgate.net/publication/301885187_Economia_computacional_complejidad_y_ciencia_de_datos_Conociendo_el_exito_empresarial_en_el_desafio_Yelp_para_61_mil_companias
## https://www.researchgate.net/publication/281979580_Que_se_escribe_respecto_al_marxismo_en_redes_sociales_Analisis_de_patrones_de_texto_a_traves_de_Twitter_por_medio_de_Data_Mining?_iepl%5BviewId%5D=uSpf17e9f5bAObGLQMtWq4lH&_iepl%5BprofilePublicationItemVariant%5D=default&_iepl%5Bcontexts%5D%5B0%5D=prfpi&_iepl%5BtargetEntityId%5D=PB%3A281979580&_iepl%5BinteractionType%5D=publicationTitle
# ===================================


##ipython notebook --profile=python
##sudo pip install tweepy

import tweepy
from tweepy import OAuthHandler
 
 ## Authenticate yourself! 
consumer_key = ''
consumer_secret = ''
access_token = ''
access_secret = ''

auth = OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_secret)
 
api = tweepy.API(auth)

#for status in tweepy.Cursor(api.home_timeline).items(10):
    ## Process a single status
    #print(status.text) 

from tweepy import Stream
from tweepy.streaming import StreamListener
 
class MyListener(StreamListener):
 
    def on_data(self, data):
        try:
            with open('XXX.json', 'a') as f:    ## Name the file you want to create to save tweets!
                f.write(data)
                return True
        except BaseException as e:
            print("Error on_data: %s" % str(e))
        return True
 
    def on_error(self, status):
        print(status)
        return True
 
twitter_stream = Stream(auth, MyListener())
twitter_stream.filter(track=['magic_word'])   ## Name the word you want to track from twitter! eg: ['Trump', 'Lord', 'Peña']
