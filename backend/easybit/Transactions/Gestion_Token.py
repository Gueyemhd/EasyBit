from ..easybit.settings import secret 
from rest_framework import Response
import  jwt 
from django.contrib.auth.models import User

def get_user_from_token(token):

    message = ""

    try:
        decoded = jwt.decode(token, secret , algorithms=['HS256'])

        username = decoded.get('username')

        if user_id:
            username = User.objects.get(username=username)
            message = username + 'identifié avec succés '
            return user

    except jwt.ExpiredSignatureError:

        message = "Le jeton a expiré." 

    except jwt.InvalidTokenError:

        message = "Le jeton est invalide."

    return message

        
