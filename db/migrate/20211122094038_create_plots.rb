class CreatePlots < ActiveRecord::Migration[6.0]
  def change
    create_table :plots do |t|
      t.string :name
      t.integer :days_since_watering
      t.references :garden, null: false, foreign_key: true
      t.references :crop, null: false, foreign_key: true

      t.timestamps
    end
  end
end
