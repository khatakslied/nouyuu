class CreateCrops < ActiveRecord::Migration[6.0]
  def change
    create_table :crops do |t|
      t.string :name
      t.string :plant_type
      t.string :plant_family
      t.text :description
      t.string :image_url
      t.integer :days_to_harvest
      t.integer :growing_season
      t.integer :spacing_in_cm
      t.integer :planting_depth_in_cm
      t.boolean :climber
      t.string :sun_exposure
      t.string :water_needs
      t.string :nitrogen_needs

      t.timestamps
    end
  end
end
