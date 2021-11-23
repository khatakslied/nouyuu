class RemoveGrowingSeasonFromCrops < ActiveRecord::Migration[6.0]
  def change
    remove_column :crops, :growing_season, :integer
  end
end
