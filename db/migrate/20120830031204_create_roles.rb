class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string  :name,        :null => false
      t.string  :description, :default => nil
      
      t.timestamps
    end
  end
end
