class V1::ItemLinesController < ApplicationController
  # GET /v1/item_lines
  # GET /v1/item_lines.json
  def index
    @v1_item_lines = V1::ItemLine.all

    render json: @v1_item_lines
  end

  # GET /v1/item_lines/1
  # GET /v1/item_lines/1.json
  def show
    @v1_item_line = V1::ItemLine.find(params[:id])

    render json: @v1_item_line
  end

  # POST /v1/item_lines
  # POST /v1/item_lines.json
  def create
    @v1_item_line = V1::ItemLine.new(v1_item_line_params)

    if @v1_item_line.save
      render json: @v1_item_line, status: :created, location: @v1_item_line
    else
      render json: @v1_item_line.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /v1/item_lines/1
  # PATCH/PUT /v1/item_lines/1.json
  def update
    @v1_item_line = V1::ItemLine.find(params[:id])

    if @v1_item_line.update(v1_item_line_params)
      head :no_content
    else
      render json: @v1_item_line.errors, status: :unprocessable_entity
    end
  end

  # DELETE /v1/item_lines/1
  # DELETE /v1/item_lines/1.json
  def destroy
    @v1_item_line = V1::ItemLine.find(params[:id])
    @v1_item_line.destroy

    head :no_content
  end

  private
    
    def v1_item_line_params
      params.require(:v1_item_line).permit(:quantity, :net_price, :product_id, :order_id, product_attributes: [:name, :net_price])
    end
end
