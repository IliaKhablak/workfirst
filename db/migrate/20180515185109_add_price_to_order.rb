class AddPriceToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :price, :float
  end
end
