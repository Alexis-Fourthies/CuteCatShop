class CartItemsController < ApplicationController
  def index
  end

  def new
  end

  def show
  end

  def update

  end

  def destroy
  end

  def edit
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
 
end
