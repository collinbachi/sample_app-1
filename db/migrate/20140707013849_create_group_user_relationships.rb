class CreateGroupUserRelationships < ActiveRecord::Migration
  def change
    create_table :leader_member_relationships do |t|
      t.integer :leader_id
      t.integer :member_id

      t.timestamps
    end
  end
end
