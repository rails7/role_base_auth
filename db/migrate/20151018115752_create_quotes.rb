class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :message
      t.string :genre
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
