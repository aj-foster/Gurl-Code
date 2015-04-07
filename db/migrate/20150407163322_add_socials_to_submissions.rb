class AddSocialsToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :instagram, :string, null: false, default: ""
    add_column :submissions, :dribbble, :string, null: false, default: ""
    add_column :submissions, :behance, :string, null: false, default: ""
  end
end
