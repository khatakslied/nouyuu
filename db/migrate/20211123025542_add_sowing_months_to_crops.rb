class AddSowingMonthsToCrops < ActiveRecord::Migration[6.0]
  def change
    add_column :crops, :sowing_months, :string
  end
end
