# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :phone,              null: false, default: ''
      t.string :encrypted_password, null: false, default: ''
      t.integer :profile_id,        null: false
      t.integer :role_id,           null: false

      ## Rememberable
      t.datetime :remember_created_at
      t.timestamps null: false
    end

    add_index :users, :phone, unique: true
  end
end
