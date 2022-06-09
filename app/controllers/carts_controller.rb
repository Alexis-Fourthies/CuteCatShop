class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_cart_owner

  def new
  end

  def create
  end

  def index
  end

  def show
    # Code de Julien pour montrer à Nico [A SUPPRIMER]
    @cart = current_user.cart
    @total = 0

    puts "#"*50
    puts "total (AVANT le each) = #{@total}"
    puts "#"*50

    @cart.items.each do |item|
      @total = @total + item.price
    end

    puts "#"*50
    puts "total (APRES le each) = #{@total}"
    puts "#"*50
  end

  def update

  end

  def destroy
  end

  def edit
  end

  private

  def check_cart_owner
    cart_owner = Cart.find(params[:id]).user
        
    unless current_user == cart_owner
      flash.notice = "Accès non autorisé."
      redirect_to root_path
    end
  end

end
