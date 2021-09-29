class UsersController < ApplicationController
  def show
  @user = User.find(params[:id])
  @music = Music.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    unless @user == current_user
           redirect_to user_path(@user)
    end
  end

  def update
    if current_user.update(user_params) # 更新出来たかを条件分岐する
      redirect_to root_path # 更新できたらrootパスへ
    else
      redirect_to action: "edit" # 失敗すれば再度マイページへ
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email) # 編集出来る情報を制限
  end

end
