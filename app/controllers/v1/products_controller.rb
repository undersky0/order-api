class V1::ProductsController < ApplicationController
   before_filter :restrict_access 
  # GET /v1/products
  # GET /v1/products.json
# 200 - :ok
# 204 - :no_content
# 400 - :bad_request
# 403 - :forbidden
# 401 - :unauthorized
# 404 - :not_found
# 410 - :gone
# 422 - :unprocessable_entity
# 500 - :internal_server_error
  def index
    @v1_products = V1::Product.all
    if @v1_products.empty?
    render json: @v1_products, message: 'Resource not found', status: 404
    else
      render json: @v1_products, message: 'OK', status: 200
    end
  end

  # GET /v1/products/1
  # GET /v1/products/1.json
  def show
    @v1_product = V1::Product.find(params[:id])

    render json: @v1_product
  end

  # POST /v1/products
  # POST /v1/products.json
  def create
    @v1_product = V1::Product.new(v1_product_params)

    if @v1_product.save
      render json: @v1_product, status: :created, location: @v1_product
    else
      render json: @v1_product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /v1/products/1
  # PATCH/PUT /v1/products/1.json
  def update
    @v1_product = V1::Product.find(params[:id])

    if @v1_product.update(v1_product_params)
      head :no_content
    else
      render json: @v1_product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /v1/products/1
  # DELETE /v1/products/1.json
  def destroy
    @v1_product = V1::Product.find(params[:id])
    @v1_product.destroy

    head :no_content
  end

  private
    
    def v1_product_params
      params.require(:v1_product).permit(:name, :net_price, :item_line => [:quantity, :net_price])
    end
end
