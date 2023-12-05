class AddRoleToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :role, :integer
    User.where('email LIKE ?', '@admin.com').update_all(role: 1)
  end
end
