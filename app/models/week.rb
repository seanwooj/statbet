class Week < ActiveRecord::Base

  # IMPORT FUNCTIONS
  def week_id= thing
  end

  def week_number= week_number
    self.week_in_season = week_number
  end

  def week_start_= thing

  end

  def start_time_= thing

  end

  def week_last_day_= thing

  end

  def week_tuesdays_= thing

  end

  def end_time_= thing

  end

  def self.parse_date string
    DateTime.strptime(string, "%m/%d/%Y %H:%M:%S %Z")
  end

end