class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:index, :show, :edit, :update]}
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
  
  # before_actionにensure_correct_userメソッドを指定
  before_action :ensure_correct_user, {only: [:edit, :update]}
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find_by(id: params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      image_name: "default_user.jpg",
      password: params[:password]
    )
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/new")
    end
  end
  
  def edit
    @user = User.find_by(id: params[:id])
  end
  
  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    
    if params[:image]
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    end
    
    if @user.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end
  end
  
  def login_form
  end
  
=begin
  これまでは
      入力されたメールアドレスとパスワードに一致したuserが存在すればログイン
  今後は
      1. フォームに入力されたメールアドレスに一致するuserを取得
      2. 入力されたパスワードとuser.passwordが一致するか判定
=end

  def login
    # メールアドレスのみを用いてユーザーを取得するよう書き換え
    @user = User.find_by(email: params[:email])
    # 入力されたemailを持つuserが存在 && 入力されたpassと暗号化されたpassが一致すること
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/posts/index")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
  end
  
  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
  end

  def likes
    # idがparams[:id]のUserｲﾝｽﾀﾝｽをDBから取得
    @user = User.find_by(id: params[:id])
    # @userと紐づくLikeインスタンスの配列をDBからwhereﾒｿｯﾄﾞで全て取得
    @likes = Like.where(user_id: @user.id)
  end
  
  # ensure_correct_userを定義し、ﾛｸﾞｲﾝﾕｰｻﾞとｱｸｾｽ先ﾕｰｻﾞﾍﾟｰｼﾞのidが不一致なら編集不可
  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
    end
  end
  
end
