class AddFlagToRfBarcodes < ActiveRecord::Migration
  def change
    add_column :rf_barcodes, :flag, :integer
  end
end
