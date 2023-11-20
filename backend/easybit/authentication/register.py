from rest_framework.response import Response
from rest_framework.decorators import api_view
from .models import Utilisateur, User



# Api which enables to fetch information in the registration page
@api_view(["POST"])
def register(request):
    error = False
    error_message = ""
    if request.method == "POST":
        first_name = request.data.get('prenom', None) 
        last_name = request.data.get('nom', None)
        username = request.data.get('username', None)
        email_adress = request.data.get("adresse_mail")
        password = request.data.get("mot_de_passe")
        password_confirmation = request.data.get("confirmation")
   
        if first_name == '' or last_name == '' or username == '' or email_adress == '' or password == '':
            error = True
            error_message = "Veuillez renseigner tous les champs!"


        try:
           
            user = User.objects.get(username__exact = username) # We're trying to see if it already exists an user with the same username
        
            print(user.username)

        except Exception as e:
           pass
        else:
      
            error = True
            error_message = f"L'utilisateur {username} existe deja!"
        
          
        if not error:
            if password != password_confirmation:
                error = True
                error_message = 'Les deux mots de passe ne correspondent pas!'
            else:
                # we create the user field related to User class
                user = User()
                user.username = username
                user.email = email_adress
                user.set_password(password)
                user.save()

                # We create the customer and store him in the database
                customer = Utilisateur()
                customer.user = user
                customer.username = username
                customer.adresse_mail = email_adress
                customer.prenom = first_name
                customer.nom = last_name
                customer.save()
                error_message = 'inscription reussie'


    context = {
            'error': error,
            'error_message': error_message,
        }

    return Response(context)
