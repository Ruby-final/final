class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.string :name
      t.text :description
      t.text :ingredient
      t.text :step
      t.string :image
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
