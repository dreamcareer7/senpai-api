class V1::Admin::UsersController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    page = strong_params[:page]

    render json: User.page(page).per(50)
  end

  def show
    @user = User.find(strong_params[:id])
    render json: @user
  end

  def all_users
    render json: User.profile_filled
  end

  def ban_user
    @user = User.find(strong_params['user_id'])
    @user.update!(banned: !@user.banned)

    render json:  @user.reload
  end

  def warn_user
    @user = User.find(strong_params['user_id'])
    @user.update!(warning_count: @user.warning_count + 1)

    render json:  @user.reload
  end

  protected

  def strong_params
    params.permit(:page, :id, :user_id, :ban)
  end
end
