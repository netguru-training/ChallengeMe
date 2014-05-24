class Team
  include Mongoid::Document
  include Mongoid::Timestamps

  resourcify

  field :name, type: String

  has_many :membership
end
