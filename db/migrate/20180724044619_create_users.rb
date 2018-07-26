class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :login,                  null: false
      t.string :email,                  null: false
      t.string :password_hash,          null: false
      t.string :access_token_hash,      default: nil
      t.string :acc_action_token_hash,  default: nil
      t.string :refresh_token_hash,     default: nil
      t.string :status,                 null: false, default: 'New'

      t.timestamps
    end
    add_index :users, :login, unique: true
    add_index :users, :email, unique: true
  end
end
