class Tournament
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String

  has_many :matches
  has_and_belongs_to_many :teams

  def matches_for_round(round)
    matches.where(round: round)
  end
end
