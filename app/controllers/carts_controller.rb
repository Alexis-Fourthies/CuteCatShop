class CartsController < ApplicationController
  def new
  end

  def create
  end

  def index
  end

  def show
    @cart = current_user.cart
    @total = 0

    @cart.items.each do |item|
      @total = @total + item.price
    end
  end

  def update

  end

  def delete
  end

  def edit
  end

  private




end # end of 'CartsController'