class CreateGardens < ActiveRecord::Migration[6.0]
  def change
    create_table :gardens do |t|
      t.integer :height
      t.integer :width
      t.string :location
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
