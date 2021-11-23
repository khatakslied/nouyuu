class AddMinDaysToHarvestToCrops < ActiveRecord::Migration[6.0]
  def change
    add_column :crops, :min_days_to_harvest, :integer
  end
end
