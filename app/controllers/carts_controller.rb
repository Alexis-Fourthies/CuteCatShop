class CartsController < ApplicationController
  def new
  end

  def create
  end

  def index
  end

  def show
    @cart = Cart.find(params[:id])
    @cart.totalprice 
  end

  def update

  end

  def delete
  end

  def edit
  end

  private

  def self.totalprice
    @total = 0

    puts "#"*50
    puts "@total= #{@total}"
    puts "#"*50

    @cart = Cart.find(params[:id])
    @cart.items.each do |item|
      @total = @total + item.price
    end
    puts "#"*50
    puts "@total= #{@total}"
    puts "#"*50
  end


end