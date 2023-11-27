"""
URL configuration for easybit project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from authentication.register import register
from converting_calculator.converting import Convert_XOF , Convert_BTC
from authentication.signing import login_view, logout_view
from Transactions.Achat_Vente import vente_bitcoin_api, confirmation_vente_api, achat_bitcoin_api,confirmation_achat_api
from Transactions.transfert import confirmation_demande_transfert_api, transfert_api


urlpatterns = [
    path("admin/", admin.site.urls),
    path("register/", register),
    path("Convert_XOF/", Convert_XOF ),
    path("Convert_BTC/", Convert_BTC),
    path("login/", login_view),
    path("logout/", logout_view),
    path('api/password_reset/', include('django_rest_passwordreset.urls', namespace='password_reset')),
    path('achat_bitcoin/', achat_bitcoin_api, name= "achat"),
    path("vente_bitcoin/", vente_bitcoin_api , name = "vente"),
    path("confirmation_vente/", confirmation_vente_api, name='confirmation_vente'),
    path("confirmation_achat/", confirmation_achat_api, name='confirmation_achat'),
    path("transfert/", transfert_api, name ='transfert' ),
    path("confirmation_transfert/", transfert_api, name ='confirmation_transfert' ),

    
]