class ChargesController < ApplicationController
  def create
 
    @amount = params[:amount]
 
    customer = Stripe::Customer.create(
     email: current_user.email,
     card: params[:stripeToken]
    )
 
    charge = Stripe::Charge.create(
     customer: customer.id, 
     amount: @amount,
     description: "BigMoney Membership - #{current_user.email}",
     currency: 'usd'
    )
 
    current_user.update_attributes(role: 'premium')

    flash[:success] = "Congratulations, you are now a premium member."
    redirect_to root_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "BigMoney Membership - #{current_user.username}",
      amount: 10_00 
    }
  end
end
