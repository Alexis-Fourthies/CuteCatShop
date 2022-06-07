class CartsController < ApplicationController
  def new
  end

  def create
  end

  def index
  end

  def show
    puts params.inspect


    puts "#"*50
    puts "on est dans le show"

  end

  def update
    puts "#"*50
    puts "on est dans la méthode update du controller carts"
    puts "#"*50
  end

  def delete
  end

  def edit
  end
end
