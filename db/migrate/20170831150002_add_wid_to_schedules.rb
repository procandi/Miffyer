class AddWidToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :wid, :string
  end
end
