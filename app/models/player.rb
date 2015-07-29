class Player < ActiveRecord::Base
  belongs_to :team

  # TODO - need to add validation to ensure player position is within some subset
  # of positions that are set.
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :position


  def full_name
    "#{self.first_name} #{self.last_name}"
  end

end