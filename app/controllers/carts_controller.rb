class CartsController < ApplicationController
  before_action :set_escape, only: [:create, :update, :destroy]

  def show
    @escapes = @cart.find_escapes
  end

  def create
    @cart.add_item(@escape.id)
    session[:cart] = @cart.contents
    redirect_to root_path
  end

  def update
    if params[:quantity] == "decrease"
      @cart.decrease_quantity(@escape.id)
    else
      @cart.increase_quantity(@escape.id)
    end
    redirect_to cart_path
  end

  def destroy
    @cart.remove_item(params[:escape_id])
    flash[:success] = "Successfully removed #{view_context.link_to(@escape.name, escape_path(@escape))} from your cart."
    redirect_to cart_path
  end

private

  def set_escape
    @escape = Escape.find(params[:escape_id])
  end

end
