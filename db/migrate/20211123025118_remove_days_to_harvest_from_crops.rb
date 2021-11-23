class RemoveDaysToHarvestFromCrops < ActiveRecord::Migration[6.0]
  def change
    remove_column :crops, :days_to_harvest, :integer
  end
end
