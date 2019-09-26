class AddPriorityToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :priority, :integer
  end
end
