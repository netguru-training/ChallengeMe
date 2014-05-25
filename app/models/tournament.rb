class Tournament
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :started, type: Boolean, default: false

  has_many :matches
  has_and_belongs_to_many :teams
  belongs_to :user

  validates_presence_of :name

  def matches_for_round(round)
    matches.where(round: round)
  end

  def started?
    started
  end
end
