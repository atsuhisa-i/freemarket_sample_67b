class UsersController < ApplicationController

  before_action :set_user_current, only: [:index]
  before_action :set_user_params, only: [:show]

  def index
  end

  def show
  end

  def edit
  end

  private
  
  def set_user_current
    @user = User.find(current_user.id)
  end

  def set_user_params
    @user = User.find(params[:id])
  end
  
end
