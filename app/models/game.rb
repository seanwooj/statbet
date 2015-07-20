class Game < ActiveRecord::Base
  # connected to weeks, teams, and broadcast network
  belongs_to :week
  has_many :team_games
  has_many :teams, :through => :team_games
  belongs_to :broadcast_network

  validates_presence_of :week
end