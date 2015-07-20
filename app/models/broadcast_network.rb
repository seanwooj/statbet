class BroadcastNetwork < ActiveRecord::Base
  # gives us information about the channel
  has_many :games
end