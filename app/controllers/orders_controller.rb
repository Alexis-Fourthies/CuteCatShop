class OrdersController < ApplicationController


  def index
  end
  
  def new
    @order = Order.create(user:current_user, total_amount:params[:total].to_f)
    
    @amount = @order.total_amount
    @stripe_amount = @amount*100
  end

  def create
    
    # Before the rescue, at the beginning of the method
    @order = Order.where(user:current_user).last
    @stripe_amount = (@order.total_amount*100).to_i # LIGNE D ORIGINE 500
    puts "#"*100
    puts "@stripe_amount = #{@stripe_amount}"
    puts "#"*100

    begin
      customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
      })
      charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @stripe_amount, 
      description: "Acheter un produit", 
      currency: 'eur',
      })
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to root_path
    end
    # After the rescue, if the payment succeeded

    # Opération de vidage du panier 
    all_cart_items = CartItem.all
    all_cart_items.each do |cart_item|
      if cart_item.cart == current_user.cart
        
        cart_item.destroy
        flash.notice = "paiement terminé - cart vidé (via une commande cart_item.destroy)"
      end
    end
    redirect_to root_path
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end



end
