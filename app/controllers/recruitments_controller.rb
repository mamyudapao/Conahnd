class RecruitmentsController < ApplicationController
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

  def show
    @recruitment = Recruitment.paginate(page: params[:page])
  end

  private
  def recruitment_params #Userモデルで許可するパラメータ
    params.require(:recruitment).permit(:title, :recruitment_numbers,:hardware,:game_id,:communication_tool,:comment)
  end

end
