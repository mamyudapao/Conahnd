class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper # SessionsHelperを読み込む
  include StaticPagesHelper #StaticPagesHelperを読み込む

  private

    def microposts_search_params
      params.require(:q).permit(:content_cont)
    end

  # ユーザーのログインを確認する
   def logged_in_user
     unless logged_in? #もしlogged_inがfalseなら
       store_location # このページのurlを保存
       flash[:danger] = "Please log in."
       redirect_to login_url #ログインページに飛ばす
     end
   end
end
