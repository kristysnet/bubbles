class Accomplishment < ActiveRecord::Base

  belongs_to :goal
  belongs_to :user

  validates_presence_of :time_frame, :goal, :user

  scope :in_time_frame, ->(time_frame) { where(time_frame: time_frame) }

end
