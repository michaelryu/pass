class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :phone
      t.string :password_digest
      t.string :remember_digest
      t.timestamps null: false
    end
  end
end