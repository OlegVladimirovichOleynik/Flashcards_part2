require 'rails_helper'

describe 'Card', type: :feature do
  let(:user) { create(:user) }
  let!(:deck) { create :deck, user: user }
  let!(:card) { create :card, user: user, deck_id: deck.id }

  before(:each) do
    login("oleg@gmail.com", "password")
  end

  before do
    card.update(review_date: Date.today)
  end

  it 'check_translation' do
    visit root_path
    fill_in 'card_original_text', with: card.original_text
    click_button 'Проверить'
    card.reload
    expect(card.review_date).to eq 3.days.from_now.to_date
    expect(page).to have_content 'Bravo'
  end

  it 'check_translation the bad' do
    visit root_path
    fill_in 'card_original_text', with: 'nothing'
    click_button 'Проверить'
    card.reload
    expect(card.review_date).to eq Date.today
    expect(page).to have_content 'Very bad'
  end

  end
