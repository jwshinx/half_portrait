class AddRoleIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role_id, :integer # :null => false ... errors out, sqlite related
  end                                                                   
end
