class ContactController < ApplicationController
  before_filter :check_message, :only => :create

  def index
  end

  def create
    Notifier.contact(params[:name], params[:subject], params[:email], params[:message]).deliver
    flash[:success] = 'Email sent successfully'
    redirect_to contact_index_path
  end

  protected

    def check_message
      if params[:email].blank? || params[:name].blank?
        flash[:error] = 'Please enter all required fields'
        flash.keep
        redirect_to contact_index_path
      end
    end
end