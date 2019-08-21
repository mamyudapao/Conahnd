class LikesController < ApplicationController
  def create
    @micropost = Micropost.find(params[:micropost_id])
    unless @micropost.favorite?(current_user)
    @micropost.favorite(current_user)
    respond_to do |format|
      format.html { redirect_to request.referrer || root_url }
      format.js
    end
  end
end

  def destroy
    @micropost = Like.find(params[:id]).micropost
    if @micropost.favorite?(current_user)
      @micropost.unfavorite(current_user)
      respond_to do |format|
        format.html {redirect_to request.referrer || root_url}
        format.js
      end
    end
  end
end
