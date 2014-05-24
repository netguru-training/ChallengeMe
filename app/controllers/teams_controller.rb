class TeamsController < ApplicationController
  expose(:teams)
  expose(:team, attributes: :team_params)

  before_filter :authenticate_user!

  def create
    if team.save
      current_user.add_role :admin, team
      team.users << current_user
      redirect_to team
    else
      render :new
    end
  end

  def update
    if team.save
      redirect_to team
    else
      render :edit
    end
  end

  def add_to_team
    team = Team.find(params[:id])
    user = User.where(email: params[:user][:email]).first
    if user
      team.users << user
      user.add_role :member, team
      flash[:notice] = "User was add to team"
    else
      flash[:error] = "User was not found"
    end
    redirect_to team
  end

  private

  def team_params
    if params[:action] == 'add_to_team'
      params.permit!
    else
      params.require(:team).permit!
    end
  end
end
