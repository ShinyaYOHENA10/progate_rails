class LikesController < ApplicationController
    # before_actionに「:authenticate_user」を追加し、ﾛｸﾞｲﾝﾕｰｻﾞのみにｱｸｾｽを制限
    before_action :authenticate_user
    
    def create
    # @likeを定義
        @like = Like.new(user_id: @current_user.id, post_id: params[:post_id])
        @like.save
        redirect_to("/posts/#{params[:post_id]}")
    end
    
  end