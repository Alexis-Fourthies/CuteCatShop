class UserMailer < ApplicationMailer
  # default from: 'n.cubilier@gmail.com' # MAILJET
  # default from: 'cutecatshop@julien-armagnac.com' #SENDGRID
  default from: 'potatosaurusflex@ik.me' # MAILJET
  
  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'https://cutecatshop.herokuapp.com/' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez CuteCatShop.fr !') 
  end


  def order_recap_email(order)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    
    #on récupère l'instance de la commande en question
    @order = order

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'https://cutecatshop.herokuapp.com/' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @order.user.email, subject: 'Récapitulatif de votre commande sur CuteCatShop.fr !') 
  end

  def admin_order_email(order)
    @order = order
    mail(to: "potatosaurusflex@ik.me", subject: 'Une commande vient d\'passée !')
  end

end
