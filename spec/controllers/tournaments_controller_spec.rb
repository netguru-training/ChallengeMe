require 'spec_helper'

describe TournamentsController do

  it "Creates a Tournament and redirects to the Tournament's page" do
  	
  	expect do 
  		post 'create', tournament: { name:'Team X'}
  	end.to change{Tournament.count}.by(1)
  end

  it "Destroy a Tournament and redirects to the Tournament's page" do
  	tournament2=Tournament.create 
  	expect do 
  		delete 'destroy' , id: tournament2.id
  	end.to change{Tournament.count}.by(-1)
  end
end
