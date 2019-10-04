class LikesController < ApplicationController
    # before_actionに「:authenticate_user」を追加し、ﾛｸﾞｲﾝﾕｰｻﾞのみにｱｸｾｽを制限
    before_action :authenticate_user
    
    # createアクションを追加　10-6で中身作成
    def create
      
    end
    
  end