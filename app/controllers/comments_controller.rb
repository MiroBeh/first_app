class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin, only: :destroy

  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    respond_to do |format|
      if @comment.save
        format.html{redirect_to @product, notice: "Review was created successfully."}
        format.json{render :show, status: :created, location: @product}
        format.js
      else
        format.html{redirect_to @product, alert: "Review was not created successfully."}
        format.json{render json: @comment.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    product = @comment.product
    @comment.destroy
    flash[:notice] = 'Comment has been destroyed'
    redirect_to product
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :rating)
  end

  def authorize_admin
    if current_user.blank? || !current_user.admin?
      redirect_to root_path, alert: 'Admins only!'
    end
  end
end
