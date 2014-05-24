class Membership
  include Mongoid::Document

  belongs_to  :user
  belongs_to  :team
end
