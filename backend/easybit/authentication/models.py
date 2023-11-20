from django.db import models
from django.contrib.auth.models import User
from enum import Enum

class Utilisateur(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name='utilisateur')
    username = models.CharField(max_length=20, default="")
    nom = models.CharField(max_length=20, default="")
    prenom = models.CharField(max_length=20, default="")
    adresse_mail = models.EmailField(max_length=30, default="")
    solde = models.DecimalField(max_digits=10, decimal_places=8, default=0)

    def __str__(self) -> str:
        return f"{self.username}"


class Type(Enum):
    VENTE = "Vente"
    ACHAT = "Achat"
    TRANSFERT = "Transfert"

class Transaction(models.Model):
    users = models.ManyToManyField(Utilisateur,)
    horodatage = models.DateTimeField(auto_now_add=True, verbose_name="Date et heure de la transaction")
    montant_btc = models.DecimalField(max_digits=10, decimal_places=8)
    montant_xof = models.DecimalField(max_digits=10, decimal_places=2)
    operateur =  models.CharField(max_length=20, default="")
    type = models.CharField(max_length=10, choices=[(tag.value, tag.value) for tag in Type], default=Type.ACHAT.value)


