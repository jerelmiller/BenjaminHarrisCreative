class ChangeVideos < ActiveRecord::Migration
  def up
    rename_column :videos, :video_url, :vimeo_url
    add_column :videos, :user_video_url, :string, after: :vimeo_url
  end

  def down
    rename_column :videos, :vimeo_url, :video_url
    remove_column :videos, :user_video_url
  end
end
