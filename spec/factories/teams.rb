FactoryGirl.define do
  factory :team do
    users {[FactoryGirl.create(:tournament)]}
    name 'team_name'
  end
end
