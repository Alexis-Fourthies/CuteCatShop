class CartsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :index, :show, :edit, :update, :destroy]

  def new
  end

  def create
  end

  def index
  end

  def show
  end

  def update
    puts "#"*50
    puts "on est dans la méthode update du controller carts"
    puts "#"*50
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
