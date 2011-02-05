class Tikkok < ActiveRecord::Base

  scope :findForDay, Proc.new{|day|
    day = Time.now unless day.present?
    y,m,d = day.year,day.month,day.day
    where('created_at >= ?',Time.new(y,m,d)).
      where('created_at < ?',Time.new(y,m,d+1))
  }
end
