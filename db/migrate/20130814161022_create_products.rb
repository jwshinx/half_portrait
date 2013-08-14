class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :allotment
      t.integer :price
      t.string :period

      t.timestamps
    end
  end
end
