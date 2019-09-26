class CreatePtBarcodes < ActiveRecord::Migration
  def change
    create_table :pt_barcodes do |t|
      t.string :pid
      t.string :site
      t.date :scandate
      t.time :scantime

      t.timestamps null: false
    end
  end
end
