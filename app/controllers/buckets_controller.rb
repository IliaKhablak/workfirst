class BucketsController < ApplicationController
  before_action :set_bucket, only: [:update, :destroy]

  # GET /buckets
  def index
    @buckets = Bucket.all

    render json: @buckets
  end

  # GET /buckets/1
  def show
    @bucket = Bucket.find_by(user_id: bucket_params['id'])
    print "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#{@bucket}"
    render json: @bucket
  end

  # POST /buckets
  def create
    @bucket = Bucket.new(bucket_params)

    if @bucket.save
      render json: @bucket, status: :created, location: @bucket
    else
      render json: @bucket.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /buckets/1
  def update
    if @bucket.update(bucket_params)
      render json: @bucket
    else
      render json: @bucket.errors, status: :unprocessable_entity
    end
  end

  # DELETE /buckets/1
  def destroy
    @bucket.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bucket
      @bucket = Bucket.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bucket_params
      params.permit(:user_id, :product_id, :id)
    end
end
