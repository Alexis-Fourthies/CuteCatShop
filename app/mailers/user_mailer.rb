class UserMailer < ApplicationMailer

  # default from: 'n.cubilier@gmail.com' # à ne pas modifier car c'est la seule 'sender address' validée sur mon compte mailJet pour le moment.
  default from: 'cutecatshop@julien-armagnac.com'

  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'https://cutecatshop.herokuapp.com/' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez CuteCatShop.fr !') 
  end


  def order_recap_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 

    #on récupère l'instance de la commande en question
    @order = user.order.last

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'https://cutecatshop.herokuapp.com/' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Récapitulatif de votre commande sur CuteCatShop.fr !') 
  end

end
