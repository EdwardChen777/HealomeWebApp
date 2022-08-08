class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.string :name
      t.text :description
      t.integer :biomarkers
      t.boolean :has_blood_tests
      t.boolean :can_upload_past_results
      t.boolean :includes_wearables

      t.timestamps
    end
  end
end
