require 'spec_helper'

describe TeamsController, :type => :controller do

  describe "add team" do
    let(:valid_team) { Team.new(:name => '')}
    let(:invalid_team) { Team.new(:name => 'Team A')}

    it "does add valid team" do
      expect do
        post 'create', valid_team
      end.to change{Team.count}.by(1)
    end

    it "after save it redirects to team page" do
      before do
        post 'create', valid_team
      end

      expect do

      end.to
    end
  end
end
