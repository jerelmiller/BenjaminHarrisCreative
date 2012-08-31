class User < ActiveRecord::Base
  authenticates_with_sorcery!
  belongs_to :role

  attr_accessible :email, :password, :password_confirmation, :first_name, :last_name, :role_id

  validates :email, :presence => true, :uniqueness => true
  validates :password, :presence => true, :confirmation => true, :on => :create
  validates :password, :presence => true, :confirmation => true, :on => :update, :unless => lambda { self.password.blank? }
  validates_presence_of :first_name, :last_name

  def to_s
    "#{first_name} #{last_initial}"
  end

  private

    def last_initial
      "#{last_name[0]}."
    end

end
