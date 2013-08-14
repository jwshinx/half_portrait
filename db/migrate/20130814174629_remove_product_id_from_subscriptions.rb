class RemoveProductIdFromSubscriptions < ActiveRecord::Migration
  def up                                   
    remove_column :subscriptions, :product_id
  end

  def down                                 
    add_column :subscriptions, :product_id, :integer
  end
end
