class AddColumnsToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :votes, :integer, null: false, default: 0
    add_column :submissions, :status, :string, null: false, default: ""
  end
end
