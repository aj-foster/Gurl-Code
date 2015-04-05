class AddSubmitterInfoToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :artist, :string, null: false, default: ""
    add_column :submissions, :facebook, :string, null: false, default: ""
    add_column :submissions, :twitter, :string, null: false, default: ""
    add_column :submissions, :pinterest, :string, null: false, default: ""
    add_column :submissions, :website, :string, null: false, default: ""
  end
end
