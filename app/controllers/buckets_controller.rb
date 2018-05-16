class BucketsController < ApplicationController
  before_action :set_bucket, only: [:show, :update, :update2 ,:delFromBucket, :destroy]

  # GET /buckets
  def index
    @buckets = Bucket.all

    render json: @buckets
  end

  # GET /buckets/1
  def show  
    x = []
    @bucket.product_id.each do |key, value|
      if Product.exists?(id: key)
        b = Product.find(key)
        c = {product: b, number:value}
        x << c
      else
        @bucket.product_id.delete(key)
        @bucket.save
      end
    end
    render json: x
  end

  # POST /buckets
  def create
    @bucket = Bucket.new(bucket_params)

    if @bucket.save
      x = []
      @bucket.product_id.each do |key, value|
        if Product.exists?(id: key)
          b = Product.find(key)
          c = {product: b, number:value}
          x << c
        else
          @bucket.product_id.delete(key)
          @bucket.save
        end
      end
      render json: x
    else
      render json: @bucket.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /buckets/1
  def update
    if @bucket.product_id[bucket_params['product_id'].to_s]

      @bucket.product_id[bucket_params['product_id'].to_s] = @bucket.product_id[bucket_params['product_id'].to_s] + 1
    else
      @bucket.product_id[bucket_params['product_id'].to_s] = 1
    end

    if @bucket.save
      x = []
      @bucket.product_id.each do |key, value|
        if Product.exists?(id: key)
          b = Product.find(key)
          c = {product: b, number:value}
          x << c
        else
          @bucket.product_id.delete(key)
          @bucket.save
        end
      end
      render json: x
    else
      render json: @bucket.errors, status: :unprocessable_entity
    end
  end

  def update2
    @bucket.product_id[bucket_params['product_id'].to_s] = @bucket.product_id[bucket_params['product_id'].to_s] - 1

    if @bucket.save
      x = []
      @bucket.product_id.each do |key, value|
       if Product.exists?(id: key)
          b = Product.find(key)
          c = {product: b, number:value}
          x << c
        else
          @bucket.product_id.delete(key)
          @bucket.save
        end
      end
      render json: x
    else
      render json: @bucket.errors, status: :unprocessable_entity
    end
  end

  def delFromBucket
    @bucket.product_id.delete(bucket_params['product_id'].to_s)
    @bucket.save
    x = []
    @bucket.product_id.each do |key, value|
      if Product.exists?(id: key)
          b = Product.find(key)
          c = {product: b, number:value}
          x << c
        else
          @bucket.product_id.delete(key)
          @bucket.save
        end
    end
    render json: x
  end

  def cleanbucket
    @bucket = Bucket.find_by(user_id: bucket_params['id'])
    @bucket.product_id = {}
    @bucket.save
  end

  def mailerb
    UserMailer.welcome_email(bucket_params['tutle'],bucket_params['milo'],bucket_params['name'],bucket_params['text']).deliver_now
  end

  # DELETE /buckets/1
  def destroy
    @bucket.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bucket
      @bucket = Bucket.find_by(user_id: bucket_params['id'])
    end

    # Only allow a trusted parameter "white list" through.
    def bucket_params
      params.permit(:user_id, :product_id, :id, :tutle, :milo, :name, :text)
    end
end
