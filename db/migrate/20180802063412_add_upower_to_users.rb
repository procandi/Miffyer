class AddUpowerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :upower, :string
  end
end
