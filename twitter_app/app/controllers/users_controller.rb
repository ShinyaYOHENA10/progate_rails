class UsersController < ApplicationController
  def index
    @users = User.all
  end

  # showアクションを追加してください
  def show
    @user = User.find_by(id: params[:id])
  end

  # newアクションを追加してください
  def new
  end
end
