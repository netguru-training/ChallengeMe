require 'spec_helper'

describe Team, :type => :model do

  describe "validation" do
    let(:team_with_empty_name) { Team.new(:name => "") }
    let(:team_with_dirty_name) { Team.new(:name => "kurcze") }

    it "have not empty name" do
      team_with_empty_name.should_not be_valid
    end

    it "does not contain dirty name" do
      team_with_dirty_name.should_not be_valid
    end


  end

end
