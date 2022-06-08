class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :cart
  has_many :orders

  after_create :create_cart

  def create_cart
    puts "Creating cart"
    Cart.create(user_id: User.find_by(email: email).id)
  end
end
