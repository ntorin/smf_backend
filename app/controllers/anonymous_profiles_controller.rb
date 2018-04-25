class AnonymousProfilesController < ApplicationController
  before_action :set_anonymous_profile, only: [:show, :update, :destroy]

  # GET /anonymous_profiles
  def index
    @anonymous_profiles = AnonymousProfile.all

    render json: @anonymous_profiles
  end

  # GET /anonymous_profiles/1
  def show
    render json: @anonymous_profile
  end

  # POST /anonymous_profiles
  def create
    @anonymous_profile = AnonymousProfile.new(anonymous_profile_params)

    if @anonymous_profile.save
      render json: @anonymous_profile, status: :created, location: @anonymous_profile
    else
      render json: @anonymous_profile.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /anonymous_profiles/1
  def update
    if @anonymous_profile.update(anonymous_profile_params)
      render json: @anonymous_profile
    else
      render json: @anonymous_profile.errors, status: :unprocessable_entity
    end
  end

  # DELETE /anonymous_profiles/1
  def destroy
    @anonymous_profile.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_anonymous_profile
      @anonymous_profile = AnonymousProfile.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def anonymous_profile_params
      params.require(:anonymous_profile).permit(:user_id, :name, :name_color)
    end
end
