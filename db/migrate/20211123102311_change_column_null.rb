class ChangeColumnNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null :tiles, :plot_id, true
  end
end
