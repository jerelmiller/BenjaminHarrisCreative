class User < ActiveRecord::Base
  authenticates_with_sorcery!
  belongs_to :role

  attr_accessible :email, :password, :password_confirmation, :first_name, :last_name, :role_id

  validates :email, :presence => true, :uniqueness => true
  validates :password, :presence => true, :confirmation => true, :on => :create

end
