module ApplicationHelper
  def nowDateTime
    Time.now.strftime("%Y-%m-%d %H:%M")
  end
end
