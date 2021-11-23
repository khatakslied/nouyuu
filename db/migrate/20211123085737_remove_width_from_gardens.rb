class RemoveWidthFromGardens < ActiveRecord::Migration[6.0]
  def change
    remove_column :gardens, :width, :integer
  end
end
