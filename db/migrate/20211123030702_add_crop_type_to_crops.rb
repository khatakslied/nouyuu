class AddCropTypeToCrops < ActiveRecord::Migration[6.0]
  def change
    add_column :crops, :crop_type, :string
  end
end
