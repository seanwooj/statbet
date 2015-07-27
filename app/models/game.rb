class Game < ActiveRecord::Base
  # connected to weeks, teams, and broadcast network
  belongs_to :week
  belongs_to :home_team, :class_name => 'Team', :foreign_key => 'home_team_id'
  belongs_to :away_team, :class_name => 'Team', :foreign_key => 'away_team_id'
  belongs_to :broadcast_network

  validates_presence_of :week
end