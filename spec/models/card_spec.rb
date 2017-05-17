require 'rails_helper'

describe Card do
  let(:card) { FactoryGirl.create(:card) }
  it 'entered the wrong text' do
    expect(card.check_translation('Nothing')).to be false
  end

  it 'entered the correct text with spaces and register' do
    expect(card.check_translation('   gOod')).to be true
  end

end
