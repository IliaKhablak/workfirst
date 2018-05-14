class CreateBuckets < ActiveRecord::Migration[5.1]
  def change
    create_table :buckets do |t|
      t.integer :user_id
      t.json :product_id, default: {}

      t.timestamps
    end
  end
end
