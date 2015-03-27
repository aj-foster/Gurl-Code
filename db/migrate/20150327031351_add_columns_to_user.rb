class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :valid_email, :boolean, default: false
    add_column :users, :handle, :string, default: ""
  end
end
