class CreateConsumptions < ActiveRecord::Migration
  def change
    create_table :consumptions do |t|
      t.integer :product_id
      t.integer :subscription_id
      t.timestamps
    end
  end
end
