class ChargesController < ApplicationController
  def new
  end

  def create
    # Amount in cents
    amount = params[:amount]
    email = params[:email]
    description = params[:description]
    stripe_token = params[:stripeToken]


    if amount.nil?
      redirect_to "http://portfolio.enchant.co?error=No $ amount picked."
    end

    customer = Stripe::Customer.create(
      :email => email,
      :card  => stripe_token
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => amount,
      :description => description,
      :currency    => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to "http://portfolio.enchant.co?error=#{e.message}"
  end

end
