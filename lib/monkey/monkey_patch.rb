class String
  def trim_mail_data
    s = self.index(" ", self.index(/charset=.* /))
    e = self.index(" --", self.index(/charset=.* /))
    self[s..e]
  end
end
