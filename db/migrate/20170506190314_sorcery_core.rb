class SorceryCore < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :salt, :string
    add_index :users, :email, unique: true
  end
end
