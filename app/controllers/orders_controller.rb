class OrdersController < ApplicationController
  def create
    event = Event.find(params[:event_id])

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        # Provide the exact Price ID (e.g. pr_1234) of the product you want to sell
        price_data: {
          currency: 'gbp',
          unit_amount: (event.price * 100).to_i,
          product_data: {
            name: 'Your order',
            description: 'Event',
            images: ['https://example.com/t-shirt.png'],
          },
        },
        quantity: 1
      }],
      mode: 'payment',
      success_url: 'http:localhost:3000/events',
      cancel_url: 'http:localhost:3000/events',
    )

  redirect session.url, 303
  order.update(checkout_session_id: session.id)
  redirect_to new_order_payment_path(order)
  end

  def show
    @order = current_user.orders.find(params[:id])
  end
end
