class RemoveDaysSinceWateringFromPlots < ActiveRecord::Migration[6.0]
  def change
    remove_column :plots, :days_since_watering, :integer
  end
end
