class AddDeckIdToUsersCards < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :deck_id, :integer
    add_column :users, :current_deck_id, :integer
    add_index :cards, :deck_id
    add_column :decks, :user_id, :integer
    add_column :decks, :card_id, :integer
  end
end
