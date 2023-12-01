from django.http import JsonResponse
from rest_framework.decorators import authentication_classes, permission_classes
from rest_framework.permissions import IsAuthenticated
from django.contrib.auth import authenticate
from authentication.models import Utilisateur, Transaction, Type, User
from decimal import Decimal
from rest_framework.decorators import api_view, permission_classes
import requests
import re
from django.utils import timezone
import json
from .Gestion_Token import get_user_from_token




# ----------------------------------------APIs pour la vente de bitcoins -------------------------------------------------------------


# API pour la validation de la demande de vente de bitcoins -------------------------------------------------------------

@api_view(['POST'])
# @permission_classes([IsAuthenticated])

def vente_bitcoin_api(request):

    token = request.headers.get('Authorization').split(' ')[1]  

    username = get_user_from_token(token)

    print("l\'utilisateur {} a été indentifié aavec succés " .format(username))

    if username:
        #le token est donc valide

        user  = User.objects.get(username=username)


        if request.method == 'POST': 

            try:
                data = json.loads(request.body.decode('utf-8'))
                montant_btc = float(data.get('montant_btc', '0'))
                montant_xof = float(data.get('montant_xof', '0'))
            

            except:
                return JsonResponse({'message': 'Montant invalide'}, status=400)


            utilisateur = Utilisateur.objects.get(user= user)
            username = utilisateur.username
            num_tel = data.get('num_tel')
            operateur = data.get('operateur')
            type = Type.VENTE.value


            # Vérifiez si le numéro de téléphone est valide
            pattern = re.compile(r'^(78|77|70)\d{7}$')

            if bool(pattern.match(num_tel)):
                num_tel = num_tel
            else:
                return JsonResponse({'message': 'Numero de téléphone invalide'}, status=400)

            if utilisateur.solde >= montant_btc and montant_btc > 0.0:
                user.utilisateur.solde -= Decimal(montant_btc)
                user.utilisateur.save()

                transaction = Transaction.objects.create(
                horodatage=timezone.now(),                 
                montant_btc=montant_btc,
                montant_xof = montant_xof,
                operateur=operateur,
                type=Type.VENTE.value
            )
                transaction.users.add(utilisateur)

                return JsonResponse({'message': 'Vente effectuée avec succes'})

            else:
                return JsonResponse({'message': 'Solde insuffisant de bitcoins pour effectuer la vente'}, status=400)

        return JsonResponse({'error': 'Méthode non autorisée'}, status=405)


    else:
        #Le token n'est pas valide
        return JsonResponse({'error':"Le token n'est pas valide" }, status=405 )

#------------------------------------------------------------------------------------------------------------------




# API pour la confirmation de la demande de vente de bitcoins --------------------------------------------------------

# @api_view(['POST'])
# @authentication_classes(['rest_framework.authentication.TokenAuthentication'])
# @permission_classes([IsAuthenticated])

# def confirmation_vente_api(request):

#     if request.method == 'POST':

#         token = request.headers.get('Authorization').split(' ')[1]

#         username =  get_user_from_token(token)

#         mot_de_passe = request.POST.get("mot_de_passe")

#         # Vérifier le nom d'utilisateur et le mot de passe et récupérer l'utilisateur
#         auth_user = authenticate(username=username, password=mot_de_passe)

#         if auth_user:
#             # Enregistrez la transaction
#             vente_data = request.session.get('vente_data')
#             montant_btc = Decimal(vente_data.get('montant_btc'))
#             montant_xof = Decimal(vente_data.get('montant_xof'))
#             operateur = vente_data.get('operateur')

#             auth_user.utilisateur.solde -= montant_btc
#             auth_user.utilisateur.save()

#             transaction = Transaction.objects.create(
#                 horodatage=timezone.now(),  
#                 user=auth_user,
#                 montant_btc=montant_btc,
#                 montant_xof = montant_xof,
#                 operateur=operateur,
#                 type=Type.VENTE.value
#             )

#             return JsonResponse({'message': 'Vente effectuée avec succès'})
#         else:
#             return JsonResponse({'message': 'Mot de passe invalide'}, status=401)

#     return JsonResponse({'error': 'Méthode non autorisée'}, status=405)


#  ----------------------------------------------------------------------------------------------------------------------------


# ----------------------------------------APIs pour l'achat de bitcoins -------------------------------------------------------------


# API pour la validation de la demande d'achat de bitcoins-------------------------------------------------------------------


@api_view(['POST'])
# @authentication_classes(['rest_framework.authentication.TokenAuthentication'])
# @permission_classes([IsAuthenticated])

def achat_bitcoin_api(request):

    token = request.headers.get('Authorization').split(' ')[1]  

    username = get_user_from_token(token)

    if username :

        user  = User.objects.get(username=username)

        if request.method == 'POST':
        

            try:
                data = json.loads(request.body.decode('utf-8'))
                montant_xof = float(data.get('montant_xof', '0'))
                montant_btc = float(data.get('montant_btc', '0'))
              
            except:
                return JsonResponse({'message': 'Montant invalide'}, status=400)


            utilisateur = Utilisateur.objects.get(user=user)
            username = utilisateur.username
            operateur = data.get('operateur')
            num_tel = data.get('num_tel')
            

            # Vérifiez si le numero de télephone est valide
            pattern = re.compile(r'^(78|77|70|76)\d{7}$')

            if bool(pattern.match(num_tel)):
                num_tel = num_tel
            else:
                return JsonResponse({'message': 'Numero de téléphone invalide'}, status=400)

            # Simuler le solde en fonction de l'opérateur
            solde_simule = 0
            if operateur == 'orange_money':
                solde_simule = 200000000  # Valeur simulée pour Orange Money
            elif operateur == 'wave':
                solde_simule = 100000  # Valeur simulée pour Wave

            # Vérifier le solde en fonction de l'opérateur choisi
            if solde_simule >= montant_xof and montant_xof > 0.0:
                
                utilisateur.solde += Decimal(montant_btc)
                utilisateur.save()

                transaction = Transaction.objects.create(
                horodatage=timezone.now(),  
                montant_btc=montant_btc,
                montant_xof=montant_xof,
                operateur=operateur,
                type=Type.ACHAT.value
            )
                transaction.users.add(utilisateur)                               

                return JsonResponse({'message': 'succes'})

            else:
                return JsonResponse({'message': 'Solde insuffisant dans le compte de mobile money'}, status=400)

        return JsonResponse({'error': 'Méthode non autorisée'}, status=405)


# API pour récupérer les informations à jour de l'utilisateur
@api_view(['GET'])
def balance_refresh(request):
    token = request.headers.get('Authorization').split(' ')[1]  

    username = get_user_from_token(token)

    user  = User.objects.get(username=username)
    utilisateur = Utilisateur.objects.get(user=user)

    solde = utilisateur.solde

    return JsonResponse({'solde': solde})


# API pour la confirmation de la demande d'achat de bitcoins--------------------------------------------------------------

# @api_view(['POST'])
# @authentication_classes(['rest_framework.authentication.TokenAuthentication'])
# @permission_classes([IsAuthenticated])

# def confirmation_achat_api(request):
#     if request.method == 'POST':

#         token = request.headers.get('Authorization').split(' ')[1]

#         username =  get_user_from_token(token)

#         mot_de_passe = request.POST.get("mot_de_passe")

#         # Vérifier le nom d'utilisateur et le mot de passe et récupérer l'utilisateur
#         utilisateur = authenticate(username=username, password=mot_de_passe)

#         if utilisateur:
#             # Enregistrez la transaction
#             achat_data = request.session.get('achat_data')
#             montant_btc = Decimal(achat_data.get('montant_btc'))
#             montant_xof = Decimal(achat_data.get('montant_xof'))
#             operateur = achat_data.get('operateur')

#             utilisateur.utilisateur.solde += montant_btc
#             utilisateur.utilisateur.save()

#             transaction = Transaction.objects.create(
#                 horodatage=timezone.now(),  
#                 user=utilisateur.utilisateur,
#                 montant_btc=montant_btc,
#                 montant_xof=montant_xof,
#                 operateur=operateur,
#                 type=Type.ACHAT.value
#             )

#             return JsonResponse({'message': 'Achat effectué avec succès'})
#         else:
#             return JsonResponse({'message': 'Mot de passe invalide'}, status=401)

#     return JsonResponse({'error': 'Méthode non autorisée'}, status=405)


# #-----------------------------------------------------------------------------------------------


# # Appel de l'API de convert_XOF ------------------------------------------------------------------


# def convertir_btc_en_xof(montant_btc):

#     conversion_api_url = 'http://127.0.0.1:8000/Convert_XOF/'
#     response = requests.post(conversion_api_url, data={'coin': float(montant_btc)})
    
#     if response.status_code == 200:
#         data = response.json()
#         return data.get('price', 0)
#     else:
#         return 0
    

#---------------------------------------------------------------------------------------------



# Appel de l'API de convert_FCA ------------------------------------------------------------------


# def convertir_xof_en_btc (montant_xof):
#     conversion_api_url = 'http://127.0.0.1:8000/Convert_BTC/'
#     response = requests.post(conversion_api_url, data={'currency': float(montant_xof)})
    
#     if response.status_code == 200:
#         data = response.json()
#         return data.get('price', 0)
#     else:
#         return 0
    



