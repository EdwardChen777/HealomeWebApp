class CreateCognitos < ActiveRecord::Migration[5.2]
  def change
    create_table :cognitos do |t|
      t.references :user, foreign_key: true 
      t.integer :expire_time
      t.integer :issued_time
      t.string :audience
      t.text :refresh_token

      t.timestamps
    end
  end
end
