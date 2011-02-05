class CreateTikkoks < ActiveRecord::Migration
  def self.up
    create_table :tikkoks do |t|
      t.string :title
      t.string :body
      t.string :from

      t.timestamps
    end
  end

  def self.down
    drop_table :tikkoks
  end
end
