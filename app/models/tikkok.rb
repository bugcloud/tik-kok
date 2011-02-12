class Tikkok < ActiveRecord::Base

   scope :findForDay, lambda{|day|
    y,m,d = day.year,day.month,day.day
    where('created_at >= ?',Time.new(y,m,d).strftime("%Y-%m-%d 00:00:00")).
      where('created_at < ?',Time.new(y,m,d+1).strftime("%Y-%m-%d 00:00:00")).
      order("created_at desc")
  }

  scope :findByDateFromAndDateTo, lambda{|from, to|
    fy,fm,fd = from.year,from.month,from.day
    ty,tm,td = to.year,to.month,to.day
    where('created_at >= ?',Time.new(fy,fm,fd).strftime("%Y-%m-%d 00:00:00")).
      where('created_at < ?',Time.new(ty,tm,td+1).strftime("%Y-%m-%d 00:00:00")).
      order("created_at desc")
  }
end
