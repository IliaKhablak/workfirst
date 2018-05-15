class AddConditionToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :condition, :string
  end
end
