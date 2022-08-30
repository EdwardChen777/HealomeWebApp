class AddColumnsToSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_column :subscriptions, :interval, :string
  end
end
