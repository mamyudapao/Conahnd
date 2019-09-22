class StaticPagesController < ApplicationController
  def home
    if logged_in? #ログイン済みか調べるメソッド
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page:params[:page])
      #検索フォームの入力内容で検索する
      @q = Micropost.ransack(params[:q])
      @contents = @q.result(distinct: true)
    end
  end

  def search
    @q = Micropost.search(search_params)
    @contents = @q.result(distinct: true)
  end

  def rule

  end

  private
    def search_params
      params.require(:q).permit(:content_cont)
    end

end
