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

	private

	def tournament_params
    params.require(:tournament).permit(:name)
  end

end
