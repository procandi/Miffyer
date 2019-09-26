class CreateHolidays < ActiveRecord::Migration
  def change
    create_table :holidays do |t|
      t.date :restdate
      t.string :resttype

      t.timestamps null: false
    end
  end
end
