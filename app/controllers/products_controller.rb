class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]

  # GET /products
  def index
    @products = Product.where(news: false)

    render json: @products
  end

  def index2
    @products = Product.where(news: true)

    render json: @products
  end

  # GET /products/1
  def show
    render json: @product
  end

  # POST /products
  def create
    @product = Product.create!(product_params)
    @product.images.map! do |x|
      a = x.split('/')
      z = a.last
      a[a.length-1] = @product.id
      a.push(z)
      x = a.join('/')
    end
    if @product.save
      @products = Product.all
      render json: {prods: @products,prod: @product}, status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
  end

  def env
    @a = {key: ENV['aws_key'], id: ENV['aws_id'], bucket: ENV['aws_bucket']}
    render json: @a
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.permit(:title, :description, :category, :news, :amount, :images => [])
    end
end
