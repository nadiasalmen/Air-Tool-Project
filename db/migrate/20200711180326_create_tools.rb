class CreateTools < ActiveRecord::Migration[6.0]
  def change
    create_table :tools do |t|
      t.string :name
      t.string :category
      t.boolean :status
      t.float :price
      t.float :rating
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
