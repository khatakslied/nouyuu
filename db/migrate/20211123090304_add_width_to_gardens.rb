class AddWidthToGardens < ActiveRecord::Migration[6.0]
  def change
    add_column :gardens, :width, :float
  end
end
