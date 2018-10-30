class CreateFoods < ActiveRecord::Migration[5.0]
  def change
    create_table :foods do |t|
      t.string :title
      t.text :description
      t.integer :answer, default: 0
      t.string :slug

      t.timestamps
    end
  end
end
