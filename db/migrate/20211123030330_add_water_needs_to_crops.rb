class AddWaterNeedsToCrops < ActiveRecord::Migration[6.0]
  def change
    add_column :crops, :water_needs, :integer
  end
end
