class OrdersController < ApplicationController
  
  def index
  end
  
  def new
  end

  def create

    # Affichage de contrôle de fonction (supprimable à terme)
    puts "#"*100
    puts "On est arrivé dans orders#create"
    puts "params[:total] = #{params[:total]}"
    puts "params[:total].class = #{params[:total].class}"
    puts "#"*100

    # Transformer le panier en nouvelle commande
    @order = Order.create(user:current_user, total_amount:params[:total].to_f) #Le total_amount sera mettre à jour après le travail sur le back du carts#show
    
    # Vérififcation de la création avec des puts en console
    puts "#"*100
    puts "La commande nouvellement créée est :\n#{@order.inspect}"
    puts "#"*100

    # Opération de vidage du panier 
    all_cart_items = CartItem.all
    all_cart_items.each do |cart_item|
      if cart_item.cart == current_user.cart
        
        cart_item.destroy
        flash.notice = "Cart vidé (via une commande cart_item.destroy)"
      end
    end
    redirect_to root_path
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
