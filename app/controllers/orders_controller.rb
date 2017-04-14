class OrdersController < ApplicationController

  def index
    @user = current_user
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(order_params)  
  end

  def new
    @order_items = @cart.find_escapes
  end
  
  private

  def order_params
    params.require(:order)  
  end
end
