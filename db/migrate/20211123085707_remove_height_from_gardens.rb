class RemoveHeightFromGardens < ActiveRecord::Migration[6.0]
  def change
    remove_column :gardens, :height, :integer
  end
end
