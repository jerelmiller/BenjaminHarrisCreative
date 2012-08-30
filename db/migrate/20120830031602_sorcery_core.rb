class SorceryCore < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :email,            :null => false # if you use this field as a username, you might want to make it :null => false.
      t.string :crypted_password, :default => nil
      t.string :salt,             :default => nil
      t.string :first_name,       :default => nil
      t.string :last_name,        :default => nil
      t.integer :role_id,         :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end