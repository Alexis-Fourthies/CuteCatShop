class Item < ApplicationRecord
  has_many :cart_items
  has_many :carts, through: :cart_items

  has_many :item_orders
  has_many :orders, through: :item_orders
end
