class CartsController < ApplicationController
  def new
  end

  def create
  end

  def index
  end

  def show
    @cart = Cart.find(params[:id])
  end

  def update

  end

  def delete
  end

  def edit
  end



  def total
    @cart = Cart.find(params[:id])
    amount = []

    @cart.items.each do |item|
      amount << item.price
    end
    
    return amount.sum
  end

end # end of 'CartsController'