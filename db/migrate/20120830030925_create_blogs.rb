class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string  :title, :default => nil
      t.text    :body,  :default => nil

      t.timestamps
    end
  end
end
