class VideosController < ApplicationController
  def index
    @videos = Video.where(display_flag: true)
  end
end