class LikesController < ApplicationController
    # before_actionに「:authenticate_user」を追加し、ﾛｸﾞｲﾝﾕｰｻﾞのみにｱｸｾｽを制限
    before_action :authenticate_user
    
    def create
    # @likeを定義
        @like = Like.new(user_id: @current_user.id, post_id: params[:post_id])
        @like.save
        redirect_to("/posts/#{params[:post_id]}")
    end

    #イイねの取り消し
    def destroy
        @like = Like.find_by(
          user_id: @current_user.id,
          post_id: params[:post_id]
          )
        # idがparams[:post_id]である投稿の詳細ページにリダイレクト(同一ページ)
         @like.destroy
         redirect_to("/posts/#{params[:post_id]}")
      end
    
  end