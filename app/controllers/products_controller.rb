class ProductsController < ApplicationController
  def index
    if params[:search].blank?
      @products = Product.all
    else
      @products = Product.search(params[:search])
    end
  end
end
