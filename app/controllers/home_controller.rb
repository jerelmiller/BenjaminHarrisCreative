class HomeController < ApplicationController
  def index
    @blog = Blog.last
    @main_video = Vimeo.get_video_info('http://vimeo.com/47907929', width: 960)
    @featured_video1 = Vimeo.get_video_info('http://vimeo.com/23220210')
    @featured_video2 = Vimeo.get_video_info('http://vimeo.com/32883090')
  end
end
