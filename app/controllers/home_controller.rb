class HomeController < ApplicationController
  def index
    @blog = Blog.last
  end
end
