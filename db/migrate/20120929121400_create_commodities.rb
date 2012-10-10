class CreateCommodities < ActiveRecord::Migration
  def self.up
    create_table :commodities do |t|
      t.string :commodity
      t.text :description
      t.references :category

      t.timestamps
    end
  end

  def self.down
    drop_table :commodities
  end
end
