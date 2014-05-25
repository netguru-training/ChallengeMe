class TournamentsController < ApplicationController
	expose(:tournament , attributes: :tournament_params )
	expose(:tournaments, attributes: :tournaments_params)

  before_filter :authenticate_user!

	def index
	end

  def show
  end

	def new
  end 

	def edit
	end

	def create
		tournament=Tournament.new(tournament_params)
    if tournament.save
      redirect_to(tournament)
      flash[:notice] = "Tournament was added"
    else
    	flash.now[:error] = "It can't be empty"
      render :new
    end
	end

  def update
    if tournament.save
      redirect_to tournament
    else
      render :edit
    end
  end

	def destroy
		tournament.destroy
		flash[:error] = 'Tournament was deleted'
		render action: :index
	end

  def add_teams
    tournament = Tournament.find(params[:id])
    teams = Team.find(params['teams']['teams'].reject(&:empty?))
    if teams
      tournament.teams << teams
      flash[:notice] = 'Teams were added to tournament'
    else
      flash[:error] = 'Teams were not found'
    end
    redirect_to tournament
  end

  def start
    tournament = Tournament.find(params[:id])
    tournament.update_attribute(:started, true)
    LadderGenerator.perform(tournament)
    flash[:notice] = 'Tournament started!'
    redirect_to tournament
  end

  def update_ladder
    round = 1
    last_round_matches = Tournament.find(params[:id]).matches_for_round(round)
    next_round_matches = Tournament.find(params[:id]).matches_for_round(round+1)
    winners = []
    last_round_matches.each do |match|
      winners << match.winner
    end
    i = 0
    winners.each_slice(2) do |winner|
      next_round_matches[i].host = winner[0]
      next_round_matches[i].guest = winner[1]
      i += 1
    end
  end

	private

	def tournament_params
    params.require(:tournament).permit(:name)
  end

end
