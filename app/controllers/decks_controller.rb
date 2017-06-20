class DecksController < ApplicationController
  before_action :find_decks, only: [:edit, :update, :destroy, :show]
  def index
    @decks = current_user.decks.all
  end

  def new
    @decks = current_user.decks.new
  end

  def create
    @decks = current_user.decks.build(decks_params)
    if @decks.save
      redirect_to decks_url
    else
      render :new
    end
  end

  def update
    if @decks.update(decks_params)
      redirect_to @decks
    else
      render 'edit'
    end
  end

  def show; end

  def edit; end

  def destroy
    @decks.destroy
    redirect_to decks_path
  end

  def find_decks
    @decks = current_user.decks.find(params[:id])
  end

  def decks_params
    params.require(:deck).permit(:name, :description)
  end
end
