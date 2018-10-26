class OtameshiController < ApplicationController
  def index
    @ts = Challonge::Tournament.find(:all)
  end
end
