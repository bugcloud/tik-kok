class AddEncodeColumnToTikkoks < ActiveRecord::Migration
  def self.up
    add_column :tikkoks, :encoding, :string
  end

  def self.down
    remove_column :tikkoks, :encoding, :string
  end
end
