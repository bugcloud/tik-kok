class Tikkok < ActiveRecord::Base

  scope :findForDay, lambda{|day|
    y,m,d = day.year,day.month,day.day
    where('created_at >= ?',Time.new(y,m,d)).
      where('created_at < ?',Time.new(y,m,d+1))
  }
end
