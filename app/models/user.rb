class User < ActiveRecord::Base

  has_many :goals
  has_many :labels
  has_many :accomplishments

  validates_presence_of :email, :first_name, :last_name
  validates_uniqueness_of :email

end
