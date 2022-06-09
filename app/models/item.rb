class Item < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  

  validates :title, 
    presence: true,
    length: { maximum: 30 }
  
  validates :description,
    presence: true,
    length: { in: 10..140 }

  validates :price,
    presence: true,
    numericality: { greater_than: 0 }

  validates :image_url,
    presence: true,
    format: URI::regexp(%w[http https])

  has_many :cart_items
  has_many :carts, through: :cart_items

  has_many :item_orders
  has_many :orders, through: :item_orders
end
