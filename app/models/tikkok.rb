class Tikkok < ActiveRecord::Base

  scope :findForDay, lambda{|day|
    y,m,d = day.year,day.month,day.day
    where('created_at >= ?',Time.new(y,m,d).strftime("%Y-%m-%d 00:00:00")).
      where('created_at < ?',Time.new(y,m,d+1).strftime("%Y-%m-%d 00:00:00")).
      order("created_at desc")
  }
end
