class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      puts "ユーザー登録が成功しました"
    else
      render :new
      puts "ユーザー登録が失敗しました"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :image)
  end
end
