class CreateTiles < ActiveRecord::Migration[6.0]
  def change
    create_table :tiles do |t|
      t.boolean :shaded
      t.integer :nitrogen_balance
      t.integer :x_position
      t.integer :y_position
      t.references :garden, null: false, foreign_key: true
      t.references :plot, null: false, foreign_key: true

      t.timestamps
    end
  end
end
