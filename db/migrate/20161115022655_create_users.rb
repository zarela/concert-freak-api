class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.string :username
      t.string :password
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
