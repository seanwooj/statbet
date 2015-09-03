class Bet < ActiveRecord::Base
  validates_presence_of :player
  validates_presence_of :start_week
  validates_presence_of :end_week

  # validate that the player chosen for the bet plays during the selected week
  # some more validations

  validates :comparison, :inclusion => { :in => ["more_than", "less_than"] }

  belongs_to :player
  belongs_to :game
  belongs_to :end_week, :class_name => 'Week', :foreign_key => 'end_week_id'
  belongs_to :start_week, :class_name => 'Week', :foreign_key => 'start_week_id'
  belongs_to :creator, :class_name => 'User', :foreign_key => 'creator_id'
  belongs_to :challenger, :class_name => 'User', :foreign_key => 'challenger_id'

  ##########
  # SCOPES #
  ##########

  scope :open, -> { where(:status => 'open') }

  #################
  # STATE MACHINE #
  #################

  state_machine :status, :initial => :open do

  end

  # These are the metrics that are available based on the player's position

  # Quarterback Metrics
  QB_BET_METRICS = [
    {:metric => 'completions'},
    {:metric => 'passing_yards'},
    {:metric => 'passing_touchdowns'},
    {:metric => 'interceptions_thrown'},
    {:metric => 'sacks'},
    {:metric => 'fumbles_lost'},
    {:metric => 'passer_rating'}
  ]

  # Runningback Metrics
  RB_BET_METRICS = [
    {:metric => 'carries'},
    {:metric => 'rushing_yards'},
    {:metric => 'average_yards_per_carry'},
    {:metric => 'rushing_touchdowns'},
    {:metric => 'longest_run'},
    {:metric => 'fumbles_lost'}
  ]

  # Wide Receiver and Tight End Metrics
  WR_TE_BET_METRICS = [
    {:metric => 'receptions'},
    {:metric => 'receiving_yards'},
    {:metric => 'average_yards_per_reception'},
    {:metric => 'receiving_touchdowns'},
    {:metric => 'longest_reception'},
    {:metric => 'fumbles_lost'}
  ]

  ALL_METRICS = (QB_BET_METRICS + RB_BET_METRICS + WR_TE_BET_METRICS).uniq


  # Available Comparisons
  COMPARISONS = [:more_than, :less_than]

  def self.get_appropriate_metric(player_position)
    case player_position
    when 'QB'
      return QB_BET_METRICS
    when 'RB'
      return RB_BET_METRICS
    when 'WR'
      return WR_TE_BET_METRICS
    when 'TE'
      return WR_TE_BET_METRICS
    else
      return ALL_METRICS
    end
  end


end
