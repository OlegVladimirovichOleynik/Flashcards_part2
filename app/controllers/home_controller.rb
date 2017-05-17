class HomeController < ApplicationController
  skip_before_action :require_login, except: [:destroy]
  before_filter :require_login, :only => :secret

  def index
    @card = current_user.cards.rand_cards.first if current_user
  end

  def secret; end
end
