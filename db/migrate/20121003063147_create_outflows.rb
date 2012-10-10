class CreateOutflows < ActiveRecord::Migration
  def self.up
    create_table :outflows do |t|
      t.float :outflow_amt
      t.references :user
      t.references :commodity

      t.timestamps
    end
  end

  def self.down
    drop_table :outflows
  end
end
