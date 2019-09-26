class CreateArrivals < ActiveRecord::Migration
  def change
    create_table :arrivals do |t|
      t.string :site
      t.integer :count
      t.string :list

      t.timestamps null: false
    end
  end
end
