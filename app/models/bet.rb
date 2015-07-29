class Bet < ActiveRecord::Base
  validates_presence_of :player
  validates_presence_of :game # game is not necessary, as there may be more than one game
  validates_presence_of :start_week
  validates_presence_of :end_week

  # validate that the player chosen for the bet plays during the selected week
  # some more validations

  belongs_to :player
  belongs_to :game
  belongs_to :end_week, :class => 'Week', :foreign_key => 'end_week_id'
  belongs_to :start_week, :class => 'Week', :foreign_key => 'start_week_id'
  belongs_to :creator, :class => 'User', :foreign_key => 'creator_id'
  belongs_to :challenger, :class => 'User', :foreign_key => 'challenger_id'


end
