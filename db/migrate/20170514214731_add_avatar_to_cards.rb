class AddAvatarToCards < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :avatar, :string
  end
end
