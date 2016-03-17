class Label < ActiveRecord::Base

  belongs_to :user

  validates_presence_of :name, :user
  validates_uniqueness_of :name, scope: :user

end
