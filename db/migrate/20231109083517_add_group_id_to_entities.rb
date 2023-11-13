class AddGroupIdToEntities < ActiveRecord::Migration[7.1]
  def change
    add_column :entities, :group_id, :integer
  end
end
