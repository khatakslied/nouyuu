class AddHeightToGardens < ActiveRecord::Migration[6.0]
  def change
    add_column :gardens, :height, :float
  end
end
