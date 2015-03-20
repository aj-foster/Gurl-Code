class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.string :title, null: false, default: ""
      t.text :message, null: false, default: ""
      t.string :status, null: false, default: ""

      t.timestamps null: false
    end
  end
end
