class AddVoteTrackingToUser < ActiveRecord::Migration
  def change
    add_column :users, :recent_vote, :integer, null: false, default: 0
  end
end
