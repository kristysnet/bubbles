class Goal < ActiveRecord::Base

  belongs_to :user
  belongs_to :label

  has_many :accomplishments

  validates_presence_of  :name, :amount, :label, :user
  validates_inclusion_of :amount, in: 1..99, message: 'should be between 1 and 99'

  def percent_complete(time_frame)
    self.accomplishments.in_time_frame(time_frame).count.to_f / self.amount.to_f
  end

end
