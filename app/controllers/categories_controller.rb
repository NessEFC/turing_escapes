class CategoriesController < ApplicationController

  def index
    @category = Category.find_by(title: params[:category_name])
  end

end
