class AddRepeatToCards < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :repeat, :integer, default: 0
  end
end
