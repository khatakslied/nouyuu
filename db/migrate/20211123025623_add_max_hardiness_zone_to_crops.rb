class AddMaxHardinessZoneToCrops < ActiveRecord::Migration[6.0]
  def change
    add_column :crops, :max_hardiness_zone, :integer
  end
end
