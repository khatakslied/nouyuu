class AddDaysSinceWateringToPlots < ActiveRecord::Migration[6.0]
  def change
    add_column :plots, :days_since_watering, :date
  end
end
