require 'spec_helper'

describe LadderGenerator do

  let(:team1) { Team.create(name: 'team1') }
  let(:team2) { Team.create(name: 'team2') }
  let(:team3) { Team.create(name: 'team3') }
  let(:team4) { Team.create(name: 'team4') }
  let(:team5) { Team.create(name: 'team5') }
  let(:team6) { Team.create(name: 'team6') }
  let(:team7) { Team.create(name: 'team7') }
  let(:team8) { Team.create(name: 'team8') }

  before do
    @tournament = Tournament.create(name: 'Turniej')
    @tournament.teams << team1
    @tournament.teams << team2
    @tournament.teams << team3
    @tournament.teams << team4
    @tournament.teams << team5
    @tournament.teams << team6
    @tournament.teams << team7
    @tournament.teams << team8
    LadderGenerator.perform(@tournament)
  end

  context 'generates first level matches' do

    it 'it saves matches' do
      expect(@tournament.matches.count).to eq 7
    end

    it 'it uses all teams in tournament' do
      match_teams = Set.new []
      @tournament.matches_for_round(1).each do |match|
        match_teams << match.host
        match_teams << match.guest
      end
      expect(@tournament.teams.to_set).to eq match_teams
    end
  end

  context 'prepares new round' do

    it 'returns all matches for round' do
      expect(@tournament.matches_for_round(2).count).to eq 2
    end

  end
end
