class Team < ActiveRecord::Base
  extend FriendlyId

  friendly_id :slug_candidates, :use => :slugged

  has_many :players
  # has_many :games, :through => :team_games

  validates_presence_of :name

  def slug_candidates
    [
      :abbreviated_name,
      :name
    ]
  end
end