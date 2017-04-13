class CartsController < ApplicationController
  def show
    @escapes = @cart.find_escapes
  end

  def create
    escape = Escape.find(params[:escape_id])
    @cart.add_item(escape.id)
    session[:cart] = @cart.contents
    redirect_to root_path
  end

  def update
    escape = Escape.find(params[:escape_id])
    if params[:quantity] == "decrease"
      @cart.decrease_quantity(escape.id)
    else
      @cart.increase_quantity(escape.id)
    end
    redirect_to cart_path
  end

  def destroy
    escape = Escape.find(params[:escape_id])
    @cart.remove_item(params[:escape_id])
    flash[:success] = "Successfully removed #{view_context.link_to(escape.name, escape_path(escape))} from your cart."
    redirect_to cart_path
  end


end
