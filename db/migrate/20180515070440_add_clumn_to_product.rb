class AddClumnToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :news, :boolean, default: false
  end
end
