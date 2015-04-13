class ChargesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    # Amount in cents
    amount = params[:amount]
    email = params[:email]
    description = params[:description]
    stripe_token = params[:stripeToken]
    redirect_url = params[:redirectURL]

    if amount.nil?
      redirect_to "#{redirect_url}?error=No $ amount picked."
    end

    if amount.to_i > 20000
      error_message = "Error with amount."
      redirect_to "#{redirect_url}?error=#{error_message}"
    end

    begin
      customer = Stripe::Customer.create(
        :email => email,
        :card  => stripe_token,
        :description => "from UX Book",
      )

      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => amount,
        :description => description,
        :currency    => 'usd'
      )

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to "#{redirect_url}?error=#{e.message}"
    end

    redirect_to "#{redirect_url}?success=true"
  end

end
