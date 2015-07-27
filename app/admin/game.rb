ActiveAdmin.register Game do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

  index do
    id_column
    column :week do |game|
      link_to game.week.try(:week_in_season), admin_week_path(game.week)
    end

    column :home_team do |game|
      if game.home_team
        link_to game.home_team.try(:name), admin_team_path(game.home_team)
      else
        'There should be a team here!'
      end
    end

    column :away_team do |game|
      if game.away_team
        link_to game.away_team.try(:name), admin_team_path(game.away_team)
      else
        'There should be a team here!'
      end
    end

    column :kickoff_time

    column :broadcast_network
  end

end
