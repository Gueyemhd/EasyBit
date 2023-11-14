from rest_framework.response import Response
from rest_framework.decorators import api_view
from .models import Utilisateur, User
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib.auth.views import PasswordResetView, PasswordResetConfirmView, PasswordResetCompleteView, PasswordResetDoneView


# API to sign in 
@api_view(["POST"])
def login_view(request):
    if request.method == "POST":
        # we fetch credentials
        username = request.data.get('username', None)
        password = request.data.get('mot_de_passe', None)

        auth_user = authenticate(username = username, password= password)
        if auth_user:
            login(request, auth_user)
            return Response({'message': 'vous êtes connecté'})

    return Response({'message': ''})



# API to sign out
@login_required
@api_view(["GET"])
def logout_view(request):
    logout(request)
    return Response({'message': 'vous êtes déconnecté'})



# APIs to reset password
# views.py



