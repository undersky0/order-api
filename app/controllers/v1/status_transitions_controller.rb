class V1::StatusTransitionsController < ApplicationController

  def index
        
      @v1_order = V1::Order.find(params[:order_id])
      @v1_status_transition = @v1_order.status_transition
    render json: @v1_status_transition, status: 200
    if params[:event].present?
    case params[:event]
      when "place"
      @v1_order.place
      puts "placed"
      #render json: {message: "Order placed"}, status: 200
    when "pay"
      @v1_order.pay
      #render json: {message: "Order payed"}, status: 200
    when "cancel"
      @v1_order.cancel
      #render json: {message: "Order Canceled"}, status: 200
    end
    end
  end


  # PATCH/PUT /v1/status_transitions/1
  # PATCH/PUT /v1/status_transitions/1.json
  def update
    if params[:order_id].present?
      @v1_order = V1::Order.find(params[:order_id])
    else
    @v1_status_transition = V1::StatusTransition.find(params[:id])
    @v1_order = @v1_status_transition.order
    end
    case params[:v1_status_transition][:event]
    when "place"
      @v1_order.place
      render json: {message: "Order placed"}, status: 200
    when "pay"
      @v1_order.pay
      render json: {message: "Order payed"}, status: 200
    when "cancel"
      @v1_order.cancel
      render json: {message: "Order Canceled"}, status: 200
    end
  end


  private
    
    def v1_status_transition_params
      params.require(:v1_status_transition).permit(:event, :order_id)
    end
end
