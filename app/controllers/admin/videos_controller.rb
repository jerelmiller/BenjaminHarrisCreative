class Admin::VideosController < Admin::AdminController
  require 'cgi'

  def index
    @videos = Video.all
  end

  def new
    @video = Video.new
  end

  def create
    vimeo_url = params[:vimeo_url]
    video_info = Vimeo.get_video_info(vimeo_url, width: 960)
    @video = Video.new

    case video_info.code
    when 404
      flash[:error] = "Sorry. That video cannot be found"
      render :new
    when 500...600
      flash[:error] = "Sorry. Something went wrong while trying to grab the video info. Please try again."
      render :new
    when 200
      @video.vimeo_id = video_info['video_id']
      @video.title = video_info['title']
      @video.description = video_info['description']
      @video.vimeo_url = vimeo_url
      @video.user_video_url = params[:user_video_url]
      @video.thumbnail_url = video_info['thumbnail_url']
      @video.embed_code = video_info['html']
      @video.player_url = extract_player_url(video_info['html'])
      @video.duration = video_info['duration']
      @video.width = video_info['width']
      @video.height = video_info['height']

      if @video.save
        flash[:success] = 'Your video has been successfully saved.'
        redirect_to admin_videos_path
      else
        flash[:error] = @video.errors.full_messages.join('<br/>')
        render :new
      end
    end
  end

  def show
    @video = Video.find(params[:id])
  end

  def destroy
    @video = Video.find(params[:id])
    if @video.destroy
      flash[:success] = 'Your video has been successfully deleted.'
    else
      flash[:error] = 'There was a problem deleting your video.'
    end
    redirect_to update_videos_admin_videos_path
  end

  def update_videos
    @videos = Video.all
  end

  def update_all
    Video.update_all(main_flag: false)
    Video.update(params[:videos].keys, params[:videos].values)

    flash[:success] = "Your videos have been successfully updated."
    redirect_to update_videos_admin_videos_path
  end

  def refresh
    @video = Video.find(params[:id])
    video_info = Vimeo.get_video_info(@video.vimeo_url, width: 960)

    case video_info.code
    when 500...600
      flash[:error] = "Sorry. Something went wrong while trying to grab the video info. Please try again."
    when 200
      @video.title = video_info['title']
      @video.description = video_info['description']
      @video.thumbnail_url = video_info['thumbnail_url']
      @video.embed_code = video_info['html']
      @video.player_url = extract_player_url(video_info['html'])
      @video.duration = video_info['duration']
      @video.width = video_info['width']
      @video.height = video_info['height']

      if @video.save
        flash[:success] = 'Your video has been successfully saved.'
      else
        flash[:error] = @video.errors.full_messages.join('<br/>')
      end
    end
    redirect_to admin_video_path(@video)
  end

  private

    def extract_player_url(url)
      CGI.unescapeHTML add_autoplay_param(url.scan(/(src=")(http:\/\/[a-z\/\.0-9\?=&;^\s]+)(")/).flatten.second)
    end

    def add_autoplay_param(base_url)
      "#{base_url}&" + { autoplay: true }.to_query
    end
end
