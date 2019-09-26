class HomeController < ApplicationController
  # before_actionにforbid_login_userメソッドを指定
  before_action :forbid_login_user, {only: [:top]}

  def top
  end
  
  def about
  end
end
