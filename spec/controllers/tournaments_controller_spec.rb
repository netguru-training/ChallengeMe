require 'spec_helper'

describe TournamentsController do
	let!(:user) { FactoryGirl.create(:user)} 
	let!(:tournament) {FactoryGirl.create(:tournament)}

 	before do
 		tournament.user = user 
		sign_in user
	end

  it "Creates a Tournament and redirects to the Tournament's page" do
  	
  	expect do 
  		post 'create', tournament: { name:'Team X'}
  	end.to change{Tournament.count}.by(1)
  end

  it "Destroy a Tournament and redirects to the Tournament's page" do
  	tournament2= FactoryGirl.create(:tournament) 
  	expect do 
  		delete 'destroy' , id: tournament2.id
  	end.to change{Tournament.count}.by(-1)
  end
end
