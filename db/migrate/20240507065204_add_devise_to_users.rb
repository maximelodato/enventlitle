# frozen_string_literal: true

class AddDeviseToUsers < ActiveRecord::Migration[7.1]
  def self.up
    change_table :users do |t|
      # Database authenticatable
      t.string :email, null: false, default: "" unless column_exists?(:users, :email)
      t.string :encrypted_password, null: false, default: "" unless column_exists?(:users, :encrypted_password)

      # Recoverable
      t.string :reset_password_token unless column_exists?(:users, :reset_password_token)
      t.datetime :reset_password_sent_at unless column_exists?(:users, :reset_password_sent_at)

      # Rememberable
      t.datetime :remember_created_at unless column_exists?(:users, :remember_created_at)

      # Trackable, Confirmable, Lockable, etc., can be added here similarly, if needed.
      
      # Uncomment below if timestamps were not included in your original model.
      # t.timestamps null: false unless column_exists?(:users, :created_at)
    end

    # Ensure indices are only added if they do not already exist
    add_index :users, :email, unique: true unless index_exists?(:users, :email)
    add_index :users, :reset_password_token, unique: true unless index_exists?(:users, :reset_password_token)
    # Additional indices can be conditionally added here.
  end

  def self.down
    # This is an irreversible migration due to the possibility of data loss when removing Devise fields.
    raise ActiveRecord::IrreversibleMigration
  end
end
