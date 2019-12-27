class CreateInventory < ActiveRecord::Migration[6.0]
  def change
    create_table :inventories do |t|
      t.string :name
      t.string :description
      t.references :category, foreign_key: true, index: true
      t.references :user, foreign_key: true, index: true
    end
  end
end
