class TopController < ApplicationController
  def main
    render 'login'
  end

  def login
    user = User.find_by(uid: params[:uid])
    if user and BCrypt::Password.new(user.pass) == params[:pass]
      #TODO: ログイン成功したことをユーザに知らせる
      session[:user_id] = user.id
      redirect_to root_path
    else
      #TODO: エラーメッセージ
      render 'login'
    end
  end

  def logout
    #TODO: ログアウトに成功したことをユーザに知らせる
    session.delete(:user_id)
    redirect_to root_path
  end
end