class PaymentsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @user = current_user
    token = params[:stripeToken]

      begin
        charge = Stripe::Charge.create(
          amount: (@product.price*100).to_i,
          currency: 'Eur',
          source: token,
          description: params[:stripeEmail],
          receipt_email: @user.email
        )

        if charge.paid
          Order.create(
            product_id: @product.id,
            user_id: @user.id,
            total: @product.price
          )
          @notice = "Your payment was processed successfully"
        end

      rescue Stripe::CardError => e
        #the card has be declined
        body = e.json_body
        err = body[:error]
        @alert = "Unfortunately, there was an error processing your payment: #{err[:message]}"
      end

      redirect_to product_path(@product), :notice => @notice , :alert => @alert


  end

end
