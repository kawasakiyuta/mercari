class CategoryController < ApplicationController
  def index
    @parents = Category.where(ancestry: nil)
  end
  def show
  end
end
