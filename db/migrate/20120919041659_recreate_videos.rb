class RecreateVideos < ActiveRecord::Migration
  def change
    drop_table :videos
    create_table :videos do |t|
      t.integer :vimeo_id,      :null => false
      t.string  :title,         :default => nil
      t.text    :description,   :default => nil
      t.string  :video_url,     :default => nil
      t.string  :thumbnail_url, :default => nil
      t.text    :embed_code,    :default => nil
      t.integer :duration,      :default => 0
      t.boolean :display_flag,  :default => true
      t.boolean :featured_flag, :default => false
      t.boolean :main_flag,     :default => false

      t.timestamps
    end
  end
end
