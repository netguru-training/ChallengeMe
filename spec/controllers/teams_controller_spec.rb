require 'spec_helper'

describe TeamsController, :type => :controller do
  let!(:team) { create(:team) }
  let(:user) { team.users.first }

  before do
    user.add_role :member, team
    sign_in user
  end


  describe 'add_admin_role' do
    let(:method) { post :add_admin_role, id: team, user: user}

    it 'add role admin to user' do
      method
      user.reload
      expect(user.has_role? :admin, team).to eq true
    end

    it 'remove role member from user' do
      method
      user.reload
      expect(user.has_role? :member, team).to eq false
    end
  end

  describe 'remove_from_team' do
    let(:method) { post :remove_from_team, id: team, user: user}

    it 'remove role member from user' do
      method
      user.reload
      expect(user.has_role? :member, team).to eq false
    end

    it 'remove user' do
      expect do
        post :remove_from_team, id: team, user: user
      end.to change { Team.find(team).users.count }.by(-1)
    end
  end

  describe 'add_to_team' do
    let(:user2) { create(:user) }

    before { user.add_role :admin, team}

    it 'add user' do
      expect do
        post :add_to_team, id: team, user: { email: user2.email }
      end.to change { Team.find(team).users.count }.by(1)
    end

    it "doesn't add user" do
      expect do
        post :add_to_team, id: team, user: { email: "invalid_email" }
      end.to_not change { Team.find(team).users.count }
    end
  end
end
