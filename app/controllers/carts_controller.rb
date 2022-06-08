class CartsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :index, :show, :edit, :update, :destroy]

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

  def authenticate_user
    unless current_user
      redirect_to new_session_path
    end
  end
end
