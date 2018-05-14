class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :images, array: true, default: []
      t.integer :amount
      t.integer :views

      t.timestamps
    end
  end
end
