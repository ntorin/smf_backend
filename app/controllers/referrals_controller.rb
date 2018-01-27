class ReferralsController < ApplicationController
  before_action :set_referral, only: [:show, :update, :destroy]

  # GET /referrals
  def index
    @referrals = Referral.all

    render json: @referrals
  end

  # GET /referrals/1
  def show
    render json: @referral
  end

  # POST /referrals
  def create
    @referral = Referral.new(referral_params)

    if @referral.save
      render json: @referral, status: :created, location: @referral
    else
      render json: @referral.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /referrals/1
  def update
    if @referral.update(referral_params)
      render json: @referral
    else
      render json: @referral.errors, status: :unprocessable_entity
    end
  end

  # DELETE /referrals/1
  def destroy
    @referral.destroy
  end

  # POST /check_user
  # user_id
  # referrer
  #
  def check_user
    status = {}
    if params[:referrer].include? '@'
      if referrer = User.where(email: params[:referrer]).first
        if referrer.id.to_s != params[:user_id]
        status = { message: 'User is valid.', valid: true, referrer_id: referrer.id}
        else
          status = { message: 'You cannot refer yourself.', valid: false }
        end
      else
        status = {message: 'User with this email doesn\'t exist.', valid: false}
      end
    else
      if referrer = User.where(identifier: params[:referrer]).first
        if referrer.id.to_s != params[:user_id]
          status = { message: 'User is valid.', valid: true, referrer_id: referrer.id}
        else
          status = { message: 'You cannot refer yourself.', valid: false }
        end
      else
        status = { message: 'User with this identifier doesn\'t exist.', valid: false}
      end
    end
    render json: status
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_referral
      @referral = Referral.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def referral_params
      params.require(:referral).permit(:user_id, :referrer_id)
    end
end
