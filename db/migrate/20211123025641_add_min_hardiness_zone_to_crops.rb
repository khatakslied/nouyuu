class AddMinHardinessZoneToCrops < ActiveRecord::Migration[6.0]
  def change
    add_column :crops, :min_hardiness_zone, :integer
  end
end
