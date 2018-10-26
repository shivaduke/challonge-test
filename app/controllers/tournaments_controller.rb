class TournamentsController < ApplicationController
  before_action :get_tournament

  def get_tournament
    @tournament = Challonge::Tournament.find(params[:id])
  end

  def index
    @player = Hash.new
    @tournament.participants.each do |p|
      @player[p.id] = p.name
    end    
  end

  def new
    @participant = nil
  end

  def create
    Challonge::Participant.create(:name => params[:name], :tournament => @tournament)
    redirect_to("/tournaments/#{params[:id]}")
  end

  def start
    @tournament.start!
    flash[:notice] = "トーナメントを開始しました"
    redirect_to("/tournaments/#{params[:id]}")
  end

  def finalize
    flash[:notice] = "トーナメントを終了しました"
    @tournament.finalize!
    redirect_to("/tournaments/#{params[:id]}")
  end

  def match
    @player = Hash.new
    @tournament.participants.each do |p|
      @player[p.id] = p.name
    end
    @match =  Challonge::Match.find(params[:match_id], :params => {:tournament_id => @tournament.id})
  end

  def update
    @match =  Challonge::Match.find(params[:match_id], :params => {:tournament_id => @tournament.id})
    @match.scores_csv = "#{params[:score1]}-#{params[:score2]}"
    if params[:score1].to_i > params[:score2].to_i
      @match.winner_id = @match.player1_id
    else
      @match.winner_id = @match.player2_id
    end
    @match.save
    redirect_to("/tournaments/#{params[:id]}")
  end

end

