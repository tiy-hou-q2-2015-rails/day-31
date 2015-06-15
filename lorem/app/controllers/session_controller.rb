class SessionController < ApplicationController
  def new
  end

  def create
    # username = params[:username]
    # password = params[:password]

    user = User.find_by username: params[:username]
    if (user) && (user.authenticate params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash.now[:alert] = "something wrong bro 😢"
      render :new
    end
  end
end
