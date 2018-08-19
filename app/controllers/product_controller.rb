class ProductController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      redirect_to products_path, notice: "El producto fue publicado con exito"
    else
     render :new 
    end
  end

  def show
    @product = Product.find(params[:id])
  end
  
  def edit
    @product = Product.find(params[:id])
    unless @product.user == current_user
      redirect_to products_path
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.user == current_user
      if @product.update(product_params)
        redirect_to products_path, notice: "Modificado con exito"
      else
        render :edit
      end
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.user == current_user
      product = Product.find(params[:id])
      product.destroy
      redirect_to products_path
    end    
  end

  private
  
  def product_params
    params.require(:product).permit(:name, :url, :description)
  end
  
end
