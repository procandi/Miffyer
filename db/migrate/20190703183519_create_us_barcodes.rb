class CreateUsBarcodes < ActiveRecord::Migration
  def change
    create_table :us_barcodes do |t|
      t.string :uid
      t.string :site
      t.date :scandate
      t.time :scantime

      t.timestamps null: false
    end
  end
end
