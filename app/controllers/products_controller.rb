class ProductsController < ApplicationController
  def show
  end

  def new
    @addresses = Address.all
    render layout: 'index'
  end

  def index
  end

  def error
  end
end
