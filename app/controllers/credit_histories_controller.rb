class CreditHistoriesController < ApplicationController
  before_action :set_credit_history, only: [:show, :update, :destroy]

  # GET /credit_histories
  def index
    @credit_histories = CreditHistory.all

    render json: @credit_histories
  end

  # GET /credit_histories/1
  def show
    render json: @credit_history
  end

  # POST /credit_histories
  def create
    @credit_history = CreditHistory.new(credit_history_params)

    if @credit_history.save
      render json: @credit_history, status: :created, location: @credit_history
    else
      render json: @credit_history.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /credit_histories/1
  def update
    if @credit_history.update(credit_history_params)
      render json: @credit_history
    else
      render json: @credit_history.errors, status: :unprocessable_entity
    end
  end

  # DELETE /credit_histories/1
  def destroy
    @credit_history.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_credit_history
      @credit_history = CreditHistory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def credit_history_params
      params.require(:credit_history).permit(:user_id, :transaction, :description)
    end
end
