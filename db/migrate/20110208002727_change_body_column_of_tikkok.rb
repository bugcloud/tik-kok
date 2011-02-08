class ChangeBodyColumnOfTikkok < ActiveRecord::Migration
  def self.up
    change_column(:tikkoks, :body, :text)
  end

  def self.down
    change_column(:tikkoks, :body, :string)
  end
end
