class RemovePlantTypeFromCrops < ActiveRecord::Migration[6.0]
  def change
    remove_column :crops, :plant_type, :string
  end
end
