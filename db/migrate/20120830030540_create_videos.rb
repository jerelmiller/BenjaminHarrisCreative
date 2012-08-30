class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string  :title,        :default => nil
      t.string  :video_url,    :default => nil
      t.boolean :display_flag, :default => true

      t.timestamps
    end
  end
end
