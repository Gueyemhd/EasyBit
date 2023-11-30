import  jwt 
from rest_framework.response import Response
import environ 

env = environ.Env(

    DEBUG = (bool ,False)
)

environ.Env.read_env(env_file ='backend\easybit\config.env' )

secret = env.str('SECRET', default = "")

print (type(secret), len(secret ))



# ----------------------------------------Fonction pour la gestion des tockens -------------------------------------------------------------


# Fonction pour la validation du tocken et l'authentification du user  -------------------------------------------------------------


def get_user_from_token( token ):

    message = ""

    try:

        decoded = jwt.decode(token, secret , algorithms=['HS256'])

        username = decoded.get('user_username')

        if username:

            return username

    except jwt.ExpiredSignatureError:

        message = 'Token expiré '


    except jwt.InvalidTokenError :

        message = 'oken invalide '
        

    return message


