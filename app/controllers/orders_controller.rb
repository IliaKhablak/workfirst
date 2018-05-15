class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]

  # GET /orders
  def index
    @orders = Order.all

      render json: @orders
  end

  # GET /orders/1
  def show
    render json: @order
  end

  # POST /orders
  def create
    @bucket = Bucket.find_by(user_id: order_params['user_id'])
    if User.exists?(id: order_params['id'])
      @user = User.find(order_params['id'])
    end
    @order = Order.new(order_params)
    if !order_params['user_email'] 
      @order.user_email = @user.email
    end
    @order.product_id = @bucket.product_id

    if @order.save
      x = []
      @order.product_id.each do |key, value|
        if Product.exists?(id: key)
          b = Product.find(key)
          c = {product: b, number:value, id: @order.id, adress: @order.adress, user_email: @order.user_email, kontakt_phone: @order.kontakt_phone, price: @order.price, user_id: @order.user_id, condition: @order.condition}
          x << c
        else
          @order.product_id.delete(key)
          @order.save
        end
      end
      render json: x
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_params
      params.permit(:user_id, :user_email, :adress, :price, :kontakt_phone, :id, :condition)
    end
end