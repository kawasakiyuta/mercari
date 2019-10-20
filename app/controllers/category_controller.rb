class CategoryController < ApplicationController
  def index
    # @parents = Category.all.order("id ASC").limit(13)
    # @parents = Category.where("path IS NULL")
    # @parents = Category.where("NULL")
    # @parents = Category.where(name: nil)
    @parents = Category.where(ancestry: nil)
    @children = Category.where(id: [:id])
  end
  def show
  end
end
