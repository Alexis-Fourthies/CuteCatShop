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
