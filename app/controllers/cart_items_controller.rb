class CartItemsController < ApplicationController
  def index
  end

  def show
  end


  def new
  end

  def create
    cart = current_user.cart
    item = Item.find(params[:item])

    puts "#"*100
    puts "On est dans cart_items#create"
    puts "current_user.cart = #{current_user.cart}"
    puts "item.id = #{item.id}"
    puts "params = #{params}"
    puts "#"*100

    cartitem = CartItem.create(cart: current_user.cart,item: item)
    puts "#"*100
    puts cartitem.inspect
    puts "#"*100
  end

  def edit
  end

  def update

  end


  def destroy
    item = CartItem.find(params[:id])
    item.destroy
    respond_to do |format|
      format.html {
        flash.notice = "Item retiré du panier"
        redirect_to cart_path(current_user.cart)
      }
      format.js {}
    end
  end 

  # def destroy
  #   puts "#"*100
  #   puts "Entrée dans CartItems#destroy"
  #   puts params.inspect
  #   puts "#"*100

  #   #3e ESSAI
  #   current_user_cartitems = current_user.cart.cart_items
  #   item_to_delete = Item.find(params[:item_id_to_delete])

  #   puts "#"*100
  #   puts "current_user_cartitems : #{current_user_cartitems}"
  #   puts "params[:item_id_to_delete] = #{params[:item_id_to_delete]}"
  #   puts "item_to_delete = #{item_to_delete.title}"
  #   puts "#"*100
 
  #   current_user_cartitems.each do |cart_item|
  #     puts "#"*100
  #     puts cart_item.item.title
  #     if cart_item.item == item_to_delete
  #       puts "-> CA MATCH !"
  #       cart_item.destroy
  #       flash.notice = "Item retiré du panier"
  #       redirect_to cart_path(current_user.cart)
  #     else 
  #       puts "-> CA MATCH PAS !"
  #     end
  #     puts "#"*100  
  #   end

  #   # 2e ESSAI
  #   # cartitems_to_delete = CartItem.where(cart:current_user.cart, item:params[:cartitem_to_delete])

  #   # puts "#"*100
  #   # puts "item_to_delete = #{cartitems_to_delete} AVANT SUPRESSION"
  #   # puts "#"*100

  #   # # Supression de tous les cartitems dont l'item est params[:item_to_delete]

  #   # cartitems_to_delete.each do |cartitem|
  #   #   cartitem.destroy
  #   # end 

  #   # puts "#"*100
  #   # puts "item_to_delete = #{cartitems_to_delete} APRES SUPRESSION"
  #   # puts "#"*100

  #   # 1er ESSAI
  #   # # Item à supprimer
  #   # @cart_items_to_delete = current_user.cart.cart_items 

  #   # puts "#"*100
  #   # puts "@cart_items_to_delete = #{@cart_items_to_delete} AVANT SUPRESSION"
  #   # @cart_items_to_delete.each do |cart_item|
  #   #   puts "cart_item n° #{cart_item.id} - #{cart_item.item.title}"
  #   #   cart_item.destroy
  #   # end
  #   # puts "#"*100

  #   # puts "#"*100
  #   # puts "@cart_items_to_delete = #{@cart_items_to_delete} APRES SUPRESSION"
  #   # @cart_items_to_delete.each do |cart_item|
  #   #   puts "cart_item n° #{cart_item.id} - #{cart_item.item.title}"
  #   # end
  #   # puts "#"*100




  # end
end
