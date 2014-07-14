class UpdateUserIdInGroups < ActiveRecord::Migration
  def change
  	 add_column :groups, :user_id, :string
  end
end
