class WelcomeController < ApplicationController
  def index
  end

  def leaderboard
    @leaders = User.order(points: :desc).limit(5)
  end
end
