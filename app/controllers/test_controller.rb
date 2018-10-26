class TestController < ApplicationController
  def index
    @challonge = Challonge::Tournament.find(:all)
  end

  def new
    @tournament = Challonge::Tournament.new
    @tournament.name = nil
    @tournament.url = nil

  end

  def create
    @tournament = Challonge::Tournament.new
    @tournament.name = params[:name]
    @tournament.url = params[:url]
    @tournament.tournament_type = params[:tournament_type]
    if @tournament.save
      flash[:notice] = 'トーナメントを作成しました'
      redirect_to("/tournaments/#{@tournament.id}")
    else
      render('test/new')
    end
  end
end
