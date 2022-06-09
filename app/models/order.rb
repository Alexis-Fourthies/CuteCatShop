class Order < ApplicationRecord
  after_create :order_recap
  
  
  belongs_to :user

  has_many :item_orders
  has_many :items, through: :item_orders

    
  def order_recap
    UserMailer.order_recap_email(self).deliver_now
    UserMailer.admin_order_email(self).deliver_now
  end
end
