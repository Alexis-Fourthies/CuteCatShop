class OrdersController < ApplicationController
  
  def index
  end
  
  def new
  end

  def create
    puts "#"*50
    puts "On est dans orders#create"
    puts "#"*50

    # Transformer le panier en nouvelle commande
    @order = Order.create(user:current_user, total_amount:111) #Le total_amount sera mettre à jour après le travail sur le back du carts#show
    
    # Vérififcation de la création par des puts en console
    puts "#"*50
    puts @order.inspect
    puts "#"*50

    # Vidage du panier 
    cartitem_to_empty = CartItem.where(cart:current_user.cart)
    puts "#"*100
    puts "#{cartitem_to_empty.first.cart}"
    puts "#{cartitem_to_empty.first.item}"
    puts "#"*100

    # CONTINUER ICI (JULIEN)
    cartitem_to_empty.each do |cartitem|
      # cartitem.item.update(item:) NON TERMINÉE
    end

    puts "#"*100
    puts "#{cartitem_to_empty.first.cart}"
    puts "#{cartitem_to_empty.first.item}"
    puts "#"*100


  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
