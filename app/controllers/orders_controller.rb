class OrdersController < ApplicationController

  def show
    @order = current_user.orders.find(params[:id])
  end

  def confirm_order
    @event = Event.find(params[:id])
    @order = Order.create(user_id: current_user.id, event_id: @event.id)
  end

  def my_orders
    @orders = Order.where(user: current_user)
  end
end
