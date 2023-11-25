from django.http import JsonResponse
from rest_framework.decorators import authentication_classes, permission_classes
from rest_framework.permissions import IsAuthenticated
from django.contrib.auth import authenticate
from authentication.models import Utilisateur, Transaction, Type
from decimal import Decimal
from rest_framework.decorators import api_view, permission_classes
import requests
import json
from django.utils import timezone




# ----------------------------------------APIs pour le transfert de bitcoins d'un utilisateur à au autre  -------------------------------------------------------------


# API pour la validation de la demande de transfert -------------------------------------------------------------

@api_view(['POST'])
@authentication_classes(['rest_framework.authentication.TokenAuthentication'])
@permission_classes([IsAuthenticated])

def transfert_api(request):
    if request.method == 'POST':

        utilisateur = request.user.utilisateur
        username = utilisateur.username
        utilisateur_destination_username = data.get('utilisateur_destination')
        type = Type.TRANSFERT.value
        montant_btc = Decimal(data.get('montant_btc', '0'))

        try:
            data = json.loads(request.body.decode('utf-8'))
            montant_btc = Decimal(data.get('montant_btc', '0'))
            montant_xof = convertir_btc_en_xof(montant_btc)
           

        except Decimal.InvalidOperation:
            return JsonResponse({'message': 'Montant invalide'}, status=400)


        # Vérifier si l'utilisateur de destination existe

        try:
            utilisateur_destination = Utilisateur.objects.get(username=utilisateur_destination_username).user
        except Utilisateur.DoesNotExist:
            return JsonResponse({'message': 'Utilisateur de destination non trouvé'}, status=400)
        

        if utilisateur.solde >= montant_btc:

            # Sauvegarder les données nécessaires dans la session

            request.session['transfert_data'] = {

                'utilisateur_source': utilisateur,
                'utilisateur_destination': utilisateur_destination,
                'montant_btc': montant_btc,
                'montant_xof' : montant_xof,

            }

            return JsonResponse({'message': 'Validation de la demande de transfert réussie'})

        else:
            return JsonResponse({'message': 'Solde insuffisant pour effectuer le transfert'}, status=400)

    return JsonResponse({'error': 'Méthode non autorisée'}, status=405)

#------------------------------------------------------------------------------------------------------------------




# API pour la confirmation de la demande de transfert de bitcoins --------------------------------------------------------

@api_view(['POST'])
@authentication_classes(['rest_framework.authentication.TokenAuthentication'])
@permission_classes([IsAuthenticated])
def confirmation_demande_transfert_api(request):

    if request.method == 'POST':
        username = request.user.username
        mot_de_passe = request.POST.get("mot_de_passe")

        # Vérifier le nom d'utilisateur et le mot de passe et récupérer l'utilisateur
        utilisateur_source = authenticate(username=username, password=mot_de_passe)

        if utilisateur_source:

            # Enregistrez la transaction
            transfert_data = request.session.get('transfert_data')

            utilisateur_destination = transfert_data.get('utilisateur_destination')
            utilisateur_source = transfert_data.get('utilisateur_source')

            montant_btc = transfert_data.get('montant_btc')
            montant_xof = Decimal(transfert_data.get('montant_xof'))

            utilisateur_source.utilisateur.solde -= montant_btc
            utilisateur_destination.utilisateur.solde += montant_btc

            utilisateur_source.utilisateur.save()
            utilisateur_destination.utilisateur.save()

            transaction = Transaction.objects.create(

            horodatage=timezone.now(),
            montant_btc=montant_btc,
            montant_xof=montant_xof,
            type=Type.TRANSFERT.value

            )

            # Ajout des utilisateurs à la transaction

            transaction.users.add(utilisateur_source, utilisateur_destination)


        

            # Effacer les données de session après confirmation
            del request.session['transfert_data']

            return JsonResponse({'message': 'Transfert effectué avec succès'})
        else:
            return JsonResponse({'message': 'Mot de passe invalide'}, status=401)

    return JsonResponse({'error': 'Méthode non autorisée'}, status=405)


#  ----------------------------------------------------------------------------------------------------------------------------





def convertir_btc_en_xof(montant_btc):

    conversion_api_url = 'http://localhost:8000/Convert_XOF/'
    response = requests.post(conversion_api_url, data={'coin': float(montant_btc)})
    
    if response.status_code == 200:
        data = response.json()
        return data.get('price', 0)
    else:
        return 0
    

#---------------------------------------------------------------------------------------------

