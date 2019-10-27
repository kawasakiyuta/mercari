class CategoryController < ApplicationController
  def index
    @parents = Category.where(ancestry: nil)
  end
  def show
    @parents = Category.where(ancestry: nil)
    @category = Category.find(params[:id])
    @products = Product.where(category: params[:id])
    @child_category = Product.where(child_category: params[:id])
    @grandchild_category = Product.where(grandchild_category: params[:id])
  end
end
