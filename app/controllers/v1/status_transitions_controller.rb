class V1::StatusTransitionsController < ApplicationController
  # GET /v1/status_transitions
  # GET /v1/status_transitions.json
  def index
    @v1_status_transitions = V1::StatusTransition.all

    render json: @v1_status_transitions
  end

  # GET /v1/status_transitions/1
  # GET /v1/status_transitions/1.json
  def show
    @v1_status_transition = V1::StatusTransition.find(params[:id])

    render json: @v1_status_transition
  end

  # POST /v1/status_transitions
  # POST /v1/status_transitions.json
  def create
    @v1_status_transition = V1::StatusTransition.new(v1_status_transition_params)

    if @v1_status_transition.save
      render json: @v1_status_transition, status: :created, location: @v1_status_transition
    else
      render json: @v1_status_transition.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /v1/status_transitions/1
  # PATCH/PUT /v1/status_transitions/1.json
  def update
    @v1_status_transition = V1::StatusTransition.find(params[:id])

    if @v1_status_transition.update(v1_status_transition_params)
      head :no_content
    else
      render json: @v1_status_transition.errors, status: :unprocessable_entity
    end
  end

  # DELETE /v1/status_transitions/1
  # DELETE /v1/status_transitions/1.json
  def destroy
    @v1_status_transition = V1::StatusTransition.find(params[:id])
    @v1_status_transition.destroy

    head :no_content
  end

  private
    
    def v1_status_transition_params
      params.require(:v1_status_transition).permit(:event, :from, :to, :order_id)
    end
end
