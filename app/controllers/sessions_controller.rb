class SessionsController < ApplicationController
  layout 'admin'
  def create
    user = login(params[:email], params[:password], false)
    if user
      redirect_back_or_to admin_root_path
    else
      flash[:error] = 'Email or password was invalid'
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end
