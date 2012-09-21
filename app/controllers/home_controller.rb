class HomeController < ApplicationController
  def index
    @blog = Blog.last
    @main_video = Video.main.first
    @featured_videos = Video.featured
  end
end
