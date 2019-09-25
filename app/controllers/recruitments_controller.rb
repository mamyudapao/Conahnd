class RecruitmentsController < ApplicationController

  def index
    if params[:q] && params[:q].reject { |key, value| value.blank? }.present?
      @q = Recruitment.ransack(search_params, activated_true: true)
    else
      @q = Recruitment.ransack(activated_true: true)
    end
    @recruitment = @q.result.paginate(page: params[:page])
  end

  def new
    @recruitment = Recruitment.new
  end

  def create
    @recruitment = Recruitment.new(recruitment_params)
    if @recruitment.save
      flash[:success] = "投稿に成功しました！"
      redirect_to recruitments_show_path
    else
      redirect_to recruitments_path
    end
  end


  private
  def recruitment_params #Userモデルで許可するパラメータ
    params.require(:recruitment).permit(:title, :recruitment_numbers,:hardware,:game_id,:communication_tool,:comment)
  end

  def search_params
    params.require(:q).permit(:title_cont)
  end

end
