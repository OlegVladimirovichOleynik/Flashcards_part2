class Deck < ApplicationRecord
  belongs_to :user
  has_many :cards, dependent: :destroy
  before_validation :normalize_name_deck, on: [:create, :edit, :update]
  validates :name, presence: true,
                 uniqueness: { confirmation: true }

  def normalize_name_deck
    self.name = name.mb_chars.downcase
  end
end
