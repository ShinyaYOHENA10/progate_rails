class ApplicationController < ActionController::Base
    # before_actionにset_current_userメソッドを指定し、各コントローラで実行されるようにする
    before_action :set_current_user
    
    # 共通アクションはapplication_controller.rbで定義
    def set_current_user
      @current_user = User.find_by(id: session[:user_id])
    end
  
  end
  