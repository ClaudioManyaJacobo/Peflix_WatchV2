# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
  
      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
  
      ## Rememberable
      t.datetime :remember_created_at
  
      t.timestamps null: false
    end
  
    add_index :users, :email, unique: true
    # Eliminar el índice único en reset_password_token
    add_index :users, :reset_password_token
  end
  
end
