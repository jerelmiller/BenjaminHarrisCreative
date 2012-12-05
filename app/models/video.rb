class Video < ActiveRecord::Base
  attr_accessible :title, :display_flag, :featured_flag, :main_flag, :user_video_url

  validates_uniqueness_of :vimeo_url, message: 'has already been used'

  def self.main
    where(main_flag: true)
  end

  def self.featured
    where(featured_flag: true)
  end
end
