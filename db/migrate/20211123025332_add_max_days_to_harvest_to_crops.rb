class AddMaxDaysToHarvestToCrops < ActiveRecord::Migration[6.0]
  def change
    add_column :crops, :max_days_to_harvest, :integer
  end
end
