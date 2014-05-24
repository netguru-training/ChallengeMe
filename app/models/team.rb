class Team
  include Mongoid::Document
  include Mongoid::Timestamps

  resourcify

  field :name, type: String

  has_and_belongs_to_many :users
end
