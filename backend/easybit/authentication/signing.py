from rest_framework.response import Response
from rest_framework.decorators import api_view
from .models import Utilisateur
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
import jwt 
from datetime import datetime, timedelta
from .models import Utilisateur , Transaction
from Transactions.Gestion_Token import get_user_from_token

# API to sign in 
@api_view(["POST"])
def login_view(request):
    if request.method == "POST":
     
      
        username = request.data.get('username', None)
        password = request.data.get('password', None)

        auth_user = authenticate(username = username, password= password)

        if auth_user:

            login(request, auth_user)
            
            try :

                utilisateur = Utilisateur.objects.filter(username=auth_user).first()    
                transactions_user = utilisateur.transaction_set.all()
                transactions_user = [{'montant_btc': t.montant_btc, 'montant_xof': t.montant_xof, 'type': t.type, 'users': [user.username for user in t.users.all()]} for t in transactions_user]
             

            except:

                transactions_user = ""

        
            payload = {

                'user_username': username,
                'exp': datetime.utcnow() + timedelta(days=1)  # expire dans 1 jour
            }

            # Générez le token JWT avec une clé secrète
            token = jwt.encode(payload, secret , algorithm='HS256')

            # Créez la réponse
            response = Response()
            #response.set_cookie(key='jwt', value=token, httponly=True)
            response.data = {
                'message': 'succes',
                'jwt': token,
                'username':username,
                'nom' : utilisateur.nom ,
                'prenom' : utilisateur.prenom,
                'adresse_mail': utilisateur.adresse_mail,
                'solde': utilisateur.solde,
                'transactions': transactions_user

            }

            return response
        
    return Response({'error_message': 'Nom d\'utilisateur ou mot de passe incorrect'}, status=401)
        





# API to sign out
@login_required
@api_view(["GET"])
def logout_view(request):
    logout(request)
    return Response({'message': 'vous êtes déconnecté'})



import environ 

env = environ.Env(

    DEBUG = (bool ,False)
)

environ.Env.read_env(env_file ='..\easybit\config.env' )

secret = env.str('SECRET', default = "")

print (type(secret), len(secret ))
