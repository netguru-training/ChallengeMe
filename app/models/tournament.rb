class Tournament
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String

  has_many :match
  has_and_belongs_to_many :teams
end
