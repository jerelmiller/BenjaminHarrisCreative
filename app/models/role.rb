class Role < ActiveRecord::Base
  has_many :users

  attr_accessible :name, :description
  validates :name, :presence => true, :uniqueness => :true

  before_create :downcase_name


  def self.admin
    where(name: 'admin').first
  end

  private

    def downcase_name
      self.name = self.name.downcase.strip
    end

end