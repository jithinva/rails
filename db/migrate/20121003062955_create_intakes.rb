class CreateIntakes < ActiveRecord::Migration
  def self.up
    create_table :intakes do |t|
      t.float :intake_amt
      t.references :user
      t.references :commodity

      t.timestamps
    end
  end

  def self.down
    drop_table :intakes
  end
end
