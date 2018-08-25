class CommentsController < ApplicationController
    def create
        product = Product.find(params[:product_id])
        
        product.comments.create(comments_params)

        redirect_to product
    end

    def destroy
        @comment = Product.find(params[:product_id])
        if @comment.user == current_user
          comment = Product.find(params[:product_id])
          comment.destroy
          redirect_to products_path
        end    
    end

  private
    def comments_params
        params.require(:comment).permit(:body).merge(user: current_user)
    end
end

