class EditPostSubs < ActiveRecord::Migration[5.2]
  def change
    change_column :post_subs, :post_id, :integer, null:true
  end
end
