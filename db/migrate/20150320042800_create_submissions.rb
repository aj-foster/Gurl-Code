class CreateSubmissions < ActiveRecord::Migration
  def self.up
    create_table :submissions do |t|
      t.references :user, index: true
      t.references :code, index: true

      t.timestamps null: false
    end
    add_foreign_key :submissions, :users
    add_foreign_key :submissions, :codes

    add_attachment :submissions, :graphic
  end

  def self.down
    remove_attachment :submissions, :graphic

    remove_foreign_key :submissions, :users
    remove_foreign_key :submissions, :codes

    remove_table :submissions
  end
end
