class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :url
      t.integer :user_id
      t.boolean :submitted
      t.boolean :processing
      t.boolean :success
      t.boolean :failure
      t.string :aasm_state

      t.timestamps
    end
    add_index :sites, :url
  end
end
