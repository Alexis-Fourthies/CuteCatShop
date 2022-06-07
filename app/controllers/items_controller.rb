class ItemsController < ApplicationController
    before_action :authenticate_user!, expect: [:index, :show]

  def index
  end

  def show
    @item = Item.find(params[:id])
    @user = current_user
     puts "#"*50
     puts current_user.cart
     #puts current_user.cart.id
     puts "#"*50
     @cart = @user.cart
  end

end
