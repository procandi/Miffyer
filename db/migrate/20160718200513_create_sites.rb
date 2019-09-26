class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :sname

      t.timestamps null: false
    end
  end
end
