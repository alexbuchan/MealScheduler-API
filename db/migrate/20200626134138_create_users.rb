# frozen_string_literal: true

# Create Users Table
class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest

      t.datetime :created_at
    end
  end
end
