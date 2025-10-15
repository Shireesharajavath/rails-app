class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :api_key
      t.string :password_digest
      t.string :photo_url
    end

    add_index :users, :api_key, unique: true
  end
end
