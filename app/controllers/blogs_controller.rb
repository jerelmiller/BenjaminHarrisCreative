class BlogsController < ApplicationController

  def index
    @blogs = Blog.order(:created_at).all
  end

  def show
    @blog = Blog.find(params[:id])
  end
end