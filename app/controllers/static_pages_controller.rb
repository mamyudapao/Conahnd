class StaticPagesController < ApplicationController
  def home
    if logged_in? #ログイン済みか調べるメソッド
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page:params[:page])
    end
  end

  def rule
  end

  def status
  end
end
