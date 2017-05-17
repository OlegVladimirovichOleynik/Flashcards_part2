class User < ApplicationRecord
  has_many :cards
  has_many :authentications, dependent: :destroy
  authenticates_with_sorcery!
  before_validation :normalize_name, on: [:create, :edit, :update]


  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end
  accepts_nested_attributes_for :authentications

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

  protected
    def normalize_name
      self.email = email.mb_chars.strip.downcase
    end
end
