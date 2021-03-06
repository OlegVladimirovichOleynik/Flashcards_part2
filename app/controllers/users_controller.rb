class UsersController < ApplicationController
  before_action :find_users, only: [:edit, :update, :destroy, :show, :current_deck]
  skip_before_action :require_login, only: [:index, :new, :create]

  def index
    @user = User.all
  end

  def show; end
  def edit; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to(root_path, notice: 'User was successfully created')
    else
      render 'new'
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  def current_deck
    @user.update_attribute(:current_deck_id, params[:id])
    redirect_to decks_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def find_users
    @user = User.find(current_user.id)
  end

end
