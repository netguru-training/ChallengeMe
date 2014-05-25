class TeamsController < ApplicationController
  expose(:teams) do
    if current_user.has_role? :super_admin
      Team.paginate(:page => params[:page], :per_page => 10)
    else
      current_user.teams
    end
 end
  expose(:team, attributes: :team_params)

  before_action :authenticate_user!
  before_action :team_admin!, only: :add_to_team

  def create
    if team.save
      current_user.add_role :admin, team
      team.users << current_user
      redirect_to team
    else
      flash[:error] = "Team has not been saved - form contains errors"
      render :new
    end
  end

  def edit

  end

  def update
    if team.save
      redirect_to team
    else
      render :edit
    end
  end

  def destroy
    team.destroy
    flash[:notice] = "You have successfully delete product"
    redirect_to team
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

  def add_admin_role
    team = Team.find(params[:id])
    user = User.find(params[:user])
    user.remove_role :member, team
    user.add_role :admin, team
    redirect_to team
  end

  def remove_from_team
    team = Team.find(params[:id])
    user = User.find(params[:user])
    user.remove_role :member, team
    team.users.delete user
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

  def team_admin!
    team = Team.find(params[:id])
    unless (current_user.has_role? :admin, team) || (current_user.has_role? :super_admin)
      redirect_to root_path
    end
  end
end
