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


  # These are the metrics that are available based on the player's position

  # Quarterback Metrics
  QB_BET_METRICS = [
    :completions,
    :passing_yards,
    :passing_touchdowns,
    :interceptions_thrown,
    :sacks,
    :fumbles_lost,
    :passer_rating
  ]

  # Runningback Metrics
  RB_BET_METRICS = [
    :carries,
    :rushing_yards,
    :average_yards_per_carry,
    :rushing_touchdowns,
    :longest_run
    :fumbles_lost
  ]

  # Wide Receiver and Tight End Metrics
  WR_TE_BET_METRICS = [
    :receptions,
    :receiving_yards,
    :average_yards_per_reception,
    :receiving_touchdowns,
    :longest_reception,
    :fumbles_lost
  ]


end
