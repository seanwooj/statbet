class Game < ActiveRecord::Base
  # connected to weeks, teams, and broadcast network
  belongs_to :week
  has_many :teams, :through => :team_games
  has_one :broadcast_network
end