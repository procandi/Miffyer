class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :pid
      t.string :pname
      t.date :birthday
      t.string :sex
      t.string :telephone
      t.string :address

      t.timestamps null: false
    end
  end
end
