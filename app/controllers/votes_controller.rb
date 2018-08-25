class VotesController < ApplicationController

  def create
    product = Product.find(params[:product_id])
    if product.votes.where(user: current_user).count == 0
      product.votes.create(user: current_user)
      redirect_to root_path
    end
  end
  
  def destroy
    product = Product.find(params[:product_id])
    if product.votes.where(user: current_user).count == 1
      product.votes.where(user: current_user).take.try(:destroy)
      redirect_to root_path
    end
  end
end
