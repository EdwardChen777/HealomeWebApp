class CreatePlanPrices < ActiveRecord::Migration[5.2]
  def change
    create_table :plan_prices do |t|
      t.references :plan, foreign_key: true
      t.float :price
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
