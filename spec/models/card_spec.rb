require 'rails_helper'

describe Card do
  let(:user) { create(:user) }
  let!(:deck) { create :deck, user: user }
  let!(:card) { create :card, user: user, deck_id: deck.id }

  it 'entered the wrong text' do
    expect(card.check_translation('Nothing')).to be false
  end

  it 'entered the correct text with spaces and register' do
    expect(card.check_translation('   gOod')).to be true
  end

  it 'change_repeat' do
    card.inc_repeat
    expect(card.repeat).to eq 1
    card.inc_repeat
    card.inc_repeat
    card.inc_repeat
    card.inc_repeat
    card.inc_repeat
    expect(card.repeat).to eq 5
    card.dec_repeat
    expect(card.repeat).to eq 4
    card.dec_repeat
    card.dec_repeat
    card.dec_repeat
    card.dec_repeat
    card.dec_repeat
    expect(card.repeat).to eq 0
  end
end
