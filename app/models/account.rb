class Account < ApplicationRecord
  # has_and_belongs_to_many :roles, join_table: :accounts_roles
  
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  
  has_many :carts, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :orders, dependent: :destroy
  after_create :create_cart
  private

  def create_cart
  Cart.create(account_id: self.id, order_id: 1)
  end

end
