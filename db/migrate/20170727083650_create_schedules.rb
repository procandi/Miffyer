class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.date :workdate
      t.string :workpart
      t.string :uid
      t.string :uname
      t.string :site

      t.timestamps null: false
    end
  end
end
