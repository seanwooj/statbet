class TeamGame < ActiveRecord::Base
  belongs_to :team
  belongs_to :game
  # join table to join two teams to a game
  # there will be 2 teamgames per game

end