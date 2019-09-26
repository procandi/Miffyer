class CreateWkBarcodes < ActiveRecord::Migration
  def change
    create_table :wk_barcodes do |t|
      t.string :wid
      t.string :site
      t.date :scandate
      t.time :scantime

      t.timestamps null: false
    end
  end
end
