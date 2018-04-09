class OrdersController < ApplicationController

  def index
    @orders = Order.includes(:product).all
  end

  def new
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
  end

  def destroy
  end

end
