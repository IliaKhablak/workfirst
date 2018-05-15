class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.json :product_id, default: {}
      t.integer :user_id, limit: 8
      t.string :adress
      t.string :user_email
      t.string :kontakt_phone

      t.timestamps
    end
  end
end
