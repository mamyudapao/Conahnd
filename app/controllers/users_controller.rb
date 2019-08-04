class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index,:edit, :update,:destroy,:following,
                                          :followers]
  before_action :current_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def index #indexページ用
    @users = User.paginate(page: params[:page]) # Userモデルをページネーションして表示する,「page:」参照するページ番号を指定
  end

  def new #サインアップ用
    @user = User.new #Userモデルに新規ユーザーを登録する下準備
  end

  def show #ユーザーの投稿表示用
    @user = User.find(params[:id]) #Userモデルからparamsのid番号のユーザーを代入する
    @microposts = @user.microposts.paginate(page: params[:page]) #@userのmaicropostをページネイトして表示
  end

  def create  #サインアップフォーム用
    @user = User.new(user_params) #strongparamsを通して、情報を代入
    if @user.save #もしuser登録が成功したら
       log_in @user #このユーザーとしてログインする
       flash[:success] = "Welcome to the Conhand!" #flashメッセージを代入する
       redirect_to @user #ユーザーのプロフィールページに飛ぶ
    else #もしuser登録が失敗したら
      render 'new' #サインアップページを再表示
    end
  end

  def edit #ユーザー情報編集用
    @user = User.find(params[:id]) #paramsのid番号のuserをuserモデルから探して代入
  end

  def update #更新用！
    @user = User.find(params[:id]) #paramsのid番号のuserをuserモデルから探して代入
    if @user.update_attributes(user_params) #更新が成功したら...
      #更新に成功した場合を扱う。
      flash[:success] = "Profile updated" #flashメッセージを代入して
      redirect_to @user #ユーザープロフィールページに飛ばす
    else #失敗したら
      render 'edit' #編集画面を再表示
    end
  end

  def destroy #アカウント削除用
    User.find(params[:id]).destroy #Userモデルから該当アカウントを削除
    flash[:success] = "User deleted" #flashメッセージを代入
    redirect_to users_url #ユーザー一覧ページに飛ばす
  end

  def following
     @title = "Following"
     @user  = User.find(params[:id])
     @users = @user.following.paginate(page: params[:page])
     render 'show_follow'
   end

   def followers
     @title = "Followers"
     @user  = User.find(params[:id])
     @users = @user.followers.paginate(page: params[:page])
     render 'show_follow'
   end


  private #内部からのみアクセス可

  def user_params #Userモデルで許可するパラメータ
    params.require(:user).permit(:name, :email,:password,:password_confirmation)
  end

  # beforeアクション

  #正しいユーザーかどうか確認
  def correct_user
    @user = User.find(params[:id]) #@userに現在のページのユーザーを代入
    redirect_to(root_url) unless @user == current_user?(@user)
  end

  #管理者かどうか確認
  def admin_user
      redirect_to(root_url) unless current_user.admin? #管理者でなかったらルートurlに飛ばす
  end
end
