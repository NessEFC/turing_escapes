class CartsController < ApplicationController
  def index
    @last_escape = @cart.find_escapes.last
  end

  def create
    escape = Escape.find(params[:escape_id])
    @cart.add_item(escape.id)
    session[:cart] = @cart.contents
    redirect_to root_path
  end
end
