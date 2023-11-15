from rest_framework.response import Response
from rest_framework.decorators import api_view
from .models import Utilisateur, User



# Api which enables to fetch information in the first registration page
@api_view(["POST"])
def first_page_register(request):
    error = False
    error_message = ""
    if request.method == "POST":
        first_name = request.data.get('prenom', None) 
        last_name = request.data.get('nom', None)
        username = request.data.get('username', None)

        if first_name == '' or last_name == '' or username == '':
            error = True
            error_message = "Veuillez renseigner tous les champs!"

        try:
            user = Utilisateur.objects.get(username__exact = username) # We're trying to see if it already exists an user with the same username
        except Exception as e:
            pass
        else:
            error = True
            error_message = f"L'utilisateur {username} existe déjà"
        
        if not error:
            first_page_registration_information = request.data
            request.session['first_page_registration'] = first_page_registration_information

    context = {
            'error': error,
            'error_message': error_message,
        }

    return Response(context)


# API to fetch information in the second registration page
@api_view(["POST"])
def second_page_register(request):
    error = False
    error_message = ""
    if request.method == "POST":
        email_adress = request.data.get("adresse_mail")
        print(email_adress)
        password = request.data.get("mot_de_passe")
        password_confirmation = request.data.get("confirmation")

        # we fetch data from first page registration stored in the session
        first_page_registration_information = request.session.get('first_page_registration')
        first_name = first_page_registration_information.get('prenom')
        last_name = first_page_registration_information.get('nom')
        username = first_page_registration_information.get('username')


        if email_adress == '' or password == '':
            error = True
            error_message = "Veuillez renseigner tous les champs!"
        
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
                error_message = 'inscription réussie'

        

    
    context = {
        'error' : error,
        'error_message' : error_message,
    }

    return Response(context)