class TeamsController < ApplicationController
  expose(:teams)
  expose(:team, attributes: :team_params)

  def create
    if team.save
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

  private

  def team_params
    params.require(:team).permit!
  end
end
