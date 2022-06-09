class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.friendly.find(params[:id])
  end






end # end of class 'ItemsController'
