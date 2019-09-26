class CreateRfBarcodes < ActiveRecord::Migration
  def change
    create_table :rf_barcodes do |t|
      t.string :rid
      t.string :site
      t.date :scandate
      t.time :scantime

      t.timestamps null: false
    end
  end
end
