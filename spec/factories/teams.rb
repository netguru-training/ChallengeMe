FactoryGirl.define do
  factory :team do
    users {[FactoryGirl.create(:user)]}
    name 'team_name'
  end
end
