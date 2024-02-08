class Customer::ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  
  def search
    if params[:search].present?
    search=params[:search].downcase
    @products=Product.where('name LIKE ?', "%#{search}%")
    else
    @products=current_account.products
    end
  end
end