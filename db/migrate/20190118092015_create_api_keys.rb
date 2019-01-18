class CreateApiKeys < ActiveRecord::Migration[5.2]
  def change
    create_table :api_keys do |t|
      t.string :access_token
      t.datetime :expires_at
      t.boolean :active
      t.integer :admin_id

      t.timestamps
    end
  end
end
