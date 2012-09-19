class Video < ActiveRecord::Base
  attr_accessible :title, :display_flag, :featured_flag, :main_flag

  validates_uniqueness_of :video_url, message: 'has already been used'
end
