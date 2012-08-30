class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

    def not_authenticated
      flash[:error] = 'You must first login to see that page'
      redirect_to login_path
    end
end
