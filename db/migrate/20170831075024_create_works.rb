class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :wid
      t.string :wname
      t.integer :wsort

      t.timestamps null: false
    end
  end
end
