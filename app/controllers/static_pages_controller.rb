class StaticPagesController < ApplicationController
  def home
    if logged_in? #ログイン済みか調べるメソッド
      if logged_in?
     @micropost = current_user.microposts.build
     if params[:q] && params[:q].reject { |key, value| value.blank? }.present?
       @q = current_user.feed.ransack(microposts_search_params)
       @feed_items = @q.result.paginate(page: params[:page])
     else
       @q = Micropost.none.ransack
       @feed_items = current_user.feed.paginate(page: params[:page])
     end
     @url = root_path
   end
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
