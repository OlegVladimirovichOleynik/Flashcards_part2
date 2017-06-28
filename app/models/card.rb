class Card < ApplicationRecord
  belongs_to :user
  belongs_to :decks
  before_validation :normalize_name, on: [:create, :edit, :update]
  mount_uploader :avatar, AvatarUploader

  before_create do
    self.review_date = Time.current
  end

  scope :rand_cards, -> { where('review_date <= ?', Time.current).order('RANDOM()') }

  validates :original_text, :translated_text, presence: true,
                                            uniqueness: { scope: :user_id }

  validates :original_text, exclusion: { in: :translated_text,
                              message: "%{value} is reserved." }

  def check_translation(text)
    original_text.strip.eql?(text.strip.downcase.titleize)
  end

  def inc_repeat
    self.repeat = repeat + 1 if repeat < 5
    change_repeat
  end

  def dec_repeat
    self.repeat = repeat - 1 if repeat > 0
    change_repeat
  end

  def change_repeat
    x = case repeat
      when 0 then 0
      when 1 then 12
      when 2 then 72
      when 3 then 168
      when 4 then 336
      else 720
    end
    update(review_date: x.hours.from_now, repeat: repeat)
  end

  protected
    def normalize_name
      self.original_text = original_text.mb_chars.strip.downcase.titleize
      self.translated_text = translated_text.mb_chars.strip.downcase.titleize
    end
end
