class AddUsortToUsers < ActiveRecord::Migration
  def change
    add_column :users, :usort, :integer
  end
end
