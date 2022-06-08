class CheckoutController < ApplicationController

    def Create
        @user = current_user
        @total= params[:total].to_d
        @session = Stripe::Checkout::session.create(
        payment_method_types: ['card']
        items_list: [
        {
        name: 'Rails Stripe Checkout',
        amount: (@total*100).to_i,
        currency: 'Eur'
        quantity: 1
        },
        ],
        success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',
        cancel_url: checkout_cancel_url 
        )
        respond_to do |format|
             format.js # renders create.js.erb
         end
    end
    
    def sucess
        @session = 	Stripe::Checkout::Session.retrive(params[:session_id])
        @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
    end
    
    def cancel
        @session = Stripe::Checkout::Session.retrive(params[:session_id])
        @payment_intent = Stripe::PaymentIntent.retrive(@session.payment_intent)
        
    
    end
    
end
