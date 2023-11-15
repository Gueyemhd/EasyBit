from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework import status

import requests

from pycoingecko import CoinGeckoAPI
from fixerio import Fixerio

cg = CoinGeckoAPI () 




# This function takes an amount in euro and converts it to XOF using the current exchange rate --------------
def obtenir_taux_change_eur_xof():
    ACCESS_KEY = 'e76e97db8d6340c4debf4be0d38387a4' 
    base_url = 'http://data.fixer.io/api/latest'
    params = {
        'access_key': ACCESS_KEY,
        'symbols': 'XOF'
    }

    response = requests.get(base_url, params=params)

    if response.status_code == 200:
        data = response.json()
        taux_change_eur_xof = data['rates']['XOF']
        print("Taux de change EUR/XOF :", taux_change_eur_xof)
        return taux_change_eur_xof
       
    else:
        raise Exception('Impossible de récupérer le taux de change EUR/XOF')




# This API allows you to convert an amount in bitcoin to (XOF). ------------------------------------------------------------------------------
@api_view(["GET", "POST", "OPTIONS"])

def Convert_XOF(request):

    taux_change_eur_xof = obtenir_taux_change_eur_xof()
    context = {} 

    if request.method == "POST" :

        # We retrieve the value of the amount to convert in XOF 
        coin_amount = request.data.get("coin")

        if coin_amount is not None and isinstance(coin_amount, (int, float)) and  coin_amount>=0:

            # We obtain the current bitcoin price value using the CoinGeckoAPI
            crypto_data = cg.get_price(
            ids='bitcoin',
            vs_currencies='eur',
            )

            bitcoin_price = crypto_data['bitcoin']['eur']

            #  We convert the amount to XOF.
            price = bitcoin_price * coin_amount * taux_change_eur_xof

            context = {
            'bitcoin_price': bitcoin_price,
            'price' : price,
            }
    
            return  Response(context)
        
        else:

             return Response({'error': 'Invalid coin amount!'}, status=status.HTTP_400_BAD_REQUEST)
        
    else : 

        return Response({"error": 'Bad request '}, status= status.HTTP_405_METHOD_NOT_ALLOWED)
#----------------------------------------------------------------------------------------------------------------------------------------------------



#This API allows you to convert an amount in XOF to bitcoin.------------------------------------------------------------------------------
@api_view(["GET", "POST", "OPTIONS"])

def Convert_BTC(request):

    taux_change_eur_xof = obtenir_taux_change_eur_xof()
    context = {} 

    if request.method == "POST" :

     # We retrieve the value of the amount to convert in BTC 
        currency_amount = request.data.get("currency")

        if currency_amount is not None and isinstance(currency_amount, (int, float)) and currency_amount>=0:

            crypto_data = cg.get_price(
            ids='bitcoin',
            vs_currencies='eur',
            )

            bitcoin_price = crypto_data['bitcoin']['eur']

            #  We convert the amount to XOF.
            price = currency_amount /(bitcoin_price * taux_change_eur_xof)

            context = {
            'currency_amount': currency_amount,
            'price' : price,
        }
    
            return  Response(context)
        
        else:

            return Response({'error': 'Invalid currency amount!'}, status=status.HTTP_400_BAD_REQUEST)
    else:
        
        return Response({"error": 'Bad request '}, status= status.HTTP_405_METHOD_NOT_ALLOWED)
        
#----------------------------------------------------------------------------------------------------------------------------------------------------

