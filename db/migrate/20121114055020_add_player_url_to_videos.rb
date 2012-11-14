class AddPlayerUrlToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :player_url, :string, default: nil, after: :video_url
  end
end
