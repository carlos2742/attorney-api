class UserController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  # load_and_authorize_resource

  # ---- Admin Services ---- #
  def profile
    render json: current_user, status: :ok;
  end

  def index
    render json:User.all.order(id: :desc), status: :ok
  end

  def show
  end

  def create
    if create_params
      params = create_params.clone
      params[:password] = '123456789'
      @user = User.create(params)
      render json: @user, status: :ok if @user
    else
      render json:{message: 'wrong params'}, status: :bad_request
    end

  end

  def update
    if update_params
      @user.name = update_params[:name]
      @user.email = update_params[:email]
      @user.rol = update_params[:role] if update_params[:role]
      render json: @user, status: :ok if @user.save
    else
      render json:{message: 'wrong params'}, status: :bad_request
    end
  end

  def destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def create_params
    params.require(:user).permit(:email, :name, :rol)
  end

  def update_params
    params.require(:user).permit(:email, :name)
  end

end
