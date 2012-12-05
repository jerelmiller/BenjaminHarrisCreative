class VideosController < ApplicationController
  def index
    @videos = Video.where(display_flag: true)
  end

  def show
    @video = Video.find_by_user_video_url(params[:id])

    redirect_to '/404' unless @video
  end
end