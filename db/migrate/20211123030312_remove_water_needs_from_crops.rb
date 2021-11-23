class RemoveWaterNeedsFromCrops < ActiveRecord::Migration[6.0]
  def change
    remove_column :crops, :water_needs, :string
  end
end
