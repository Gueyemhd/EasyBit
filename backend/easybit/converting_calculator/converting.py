from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework import status

import requests

from pycoingecko import CoinGeckoAPI

cg = CoinGeckoAPI () 







# This API allows you to convert an amount in bitcoin to (XOF). ------------------------------------------------------------------------------
@api_view(["GET", "POST", "OPTIONS"])

def Convert_XOF(request):

    taux_change_eur_xof = 655.957
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

    taux_change_eur_xof = 655.957
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

