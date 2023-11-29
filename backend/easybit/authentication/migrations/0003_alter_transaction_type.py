# Generated by Django 4.2.7 on 2023-11-19 15:19

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("authentication", "0002_remove_transaction_user_transaction_users_and_more"),
    ]

    operations = [
        migrations.AlterField(
            model_name="transaction",
            name="type",
            field=models.CharField(
                choices=[
                    ("Vente", "Vente"),
                    ("Achat", "Achat"),
                    ("Transfert", "Transfert"),
                ],
                default="Achat",
                max_length=10,
            ),
        ),
    ]