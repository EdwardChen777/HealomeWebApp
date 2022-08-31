class AddSubscriptionIdToSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_column :subscriptions, :subscription_id, :string
  end
end
