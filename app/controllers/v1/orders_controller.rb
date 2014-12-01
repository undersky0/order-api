class V1::OrdersController < ApplicationController
  # GET /v1/orders
  # GET /v1/orders.json

  def index
    @v1_orders = V1::Order.all

    if @v1_orders.nil?
    render json: @v1_orders, message: 'Resource not found', status: 404
    else
      render json: @v1_orders, message: 'OK', status: 200
    end
  end

  # GET /v1/orders/1
  # GET /v1/orders/1.json
  def show
    @v1_order = V1::Order.find(params[:id])

   if @v1_order.nil?
    render json: @v1_order, message: 'Resource not found', status: 404
    else
      render json: @v1_order, message: 'OK', status: 200
    end
  end

  # POST /v1/orders
  # POST /v1/orders.json
  def create

      @v1_order = V1::Order.new(v1_order_params)

    if @v1_order.save
      render json: @v1_order, status: :OK, location: @v1_order
    else
      render json: @v1_order.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /v1/orders/1
  # PATCH/PUT /v1/orders/1.json
  def update
    @v1_order = V1::Order.find(params[:id])

    case @v1_order.state
    when 0
    if @v1_order.update(v1_order_params)
      head :no_content
    else
      render json: @v1_order.errors, status: :unprocessable_entity
    end
    else
      render json: {message: 'Can be edited only when in draft(0) state'}, status: 400
    end
      
  end

  # DELETE /v1/orders/1
  # DELETE /v1/orders/1.json
  def destroy
    @v1_order = V1::Order.find(params[:id])
    @v1_order.destroy

    head :no_content
  end

  private    
    def v1_order_params
      params.require(:v1_order).permit(:state, :vat, :order_date, :user_id, :item_lines_attributes => [:id, :quantity, :net_price])
    end
    
end
