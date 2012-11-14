class AddColumnsWidthAndHeightToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :width, :integer, default: nil, after: :duration
    add_column :videos, :height, :integer, default: nil, after: :width
  end
end
