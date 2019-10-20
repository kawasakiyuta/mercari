class CategoryController < ApplicationController
  def index
    @parents = Category.where(ancestry: nil)
    @children = Category.where(ancestry: 1)
  end
  def show
  end
end
