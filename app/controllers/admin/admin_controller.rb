class Admin::AdminController < ApplicationController
  layout 'admin'
  before_filter :require_login

  def index
  end
end