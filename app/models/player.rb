class Player < ActiveRecord::Base
  belongs_to :team

  # TODO - need to add validation to ensure player position is within some subset
  # of positions that are set.
  validates_presence_of :name
  validates_presence_of :player_position

end