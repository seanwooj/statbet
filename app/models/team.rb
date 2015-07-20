class Team < ActiveRecord::Base
  has_many :players
  has_many :games, :through => :team_games
end