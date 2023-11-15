from django.contrib import admin
from .models import Utilisateur, Transaction

admin.site.register(Utilisateur)
admin.site.register(Transaction)