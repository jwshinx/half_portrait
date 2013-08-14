class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.date :anniversary_date
      t.boolean :active
      t.integer :product_id
      t.integer :customer_id

      t.timestamps
    end
  end
end
