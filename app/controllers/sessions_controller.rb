class SessionsController < ApplicationController
  layout 'admin'
  before_filter :check_current_user, :only => :new
  
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

  private

    def check_current_user
      redirect_to admin_root_path if current_user
    end
end
