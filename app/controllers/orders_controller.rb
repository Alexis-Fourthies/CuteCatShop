class OrdersController < ApplicationController
  
  def index
  end
  
  def new
  end

  def create
    puts "#"*100
    puts "On est arrivé dans orders#create"
    puts "#"*100

    # Transformer le panier en nouvelle commande
    @order = Order.create(user:current_user, total_amount:params[:total]) #Le total_amount sera mettre à jour après le travail sur le back du carts#show
    
    # Vérififcation de la création avec des puts en console
    puts "#"*100
    puts "La commande fraîchement créée est :\n#{@order.inspect}"
    puts "#"*100

    # Récupération des bonnes données pour vider ce panier
    @cartitem_to_empty = CartItem.where(cart:current_user.cart)
    # Vérififcation de la création par des puts en console
    puts "#"*100
    puts "Le cart à vider est :\n#{@current_user.cart}"
    puts "Les cartitems associé à ce cart sont : #{@cartitem_to_empty}"
    puts "Ils sont au nombre de : #{@cartitem_to_empty.size}"
    puts "Les items associés à chaque cartitem sont :"
    
    @cartitem_to_empty.each do |cartitem|
      puts cartitem.item.title
    end
    puts "#"*100

    # Actiond de vidage du panier
    puts "#"*100
    puts "Début de suppression de chaque cartitem"
    @cartitem_to_empty.each do |cartitem|
      puts cartitem.destroy
    end
    puts "#"*100

    # Vérififcation du vidage avec des puts en console
    puts "#"*100
    puts "Le cart supposément vidé est :\n#{@current_user.cart}"
    puts "Les cartitems associé à ce cart sont : #{@cartitem_to_empty}"
    puts "Ils sont au nombre de : #{@cartitem_to_empty.size}"
    puts "Les items associés à chaque cartitem sont :"
    @cartitem_to_empty.each do |cartitem|
      puts cartitem.item.title
    end
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
