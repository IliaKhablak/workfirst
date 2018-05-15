class ChangeColumnBucket < ActiveRecord::Migration[5.1]
  def change
  	remove_column :buckets, :user_id
  	add_column :buckets, :user_id, :integer, limit: 8
  end
end
