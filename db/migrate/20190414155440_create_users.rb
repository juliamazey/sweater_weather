class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, index: true
      t.string :password_digest
      t.text :api_key

      t.timestamps
    end
  end
end
