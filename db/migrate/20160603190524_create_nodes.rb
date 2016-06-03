class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.integer :value
      t.integer :left_id
      t.integer :right_id

      t.timestamps null: false
    end
  end
end
