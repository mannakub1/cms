class EditAdminIdToMemberId < ActiveRecord::Migration[5.2]
  def change
   remove_column :api_keys, :admin_id
   add_column :api_keys, :member_id, :integer
   #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
