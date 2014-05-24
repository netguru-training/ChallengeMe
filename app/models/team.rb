class Team
  include Mongoid::Document
  include Mongoid::Timestamps

  resourcify

  field :name, type: String
 
  has_and_belongs_to_many :tournaments
  has_and_belongs_to_many :users

  DIRTY_WORDS = %W{
      kurcze
  }

  field :name, type: String

  validates_presence_of :name
  validate :filter_dirty_words

  def filter_dirty_words
    if DIRTY_WORDS.include?(name)
      errors.add(:name, 'Team name contains dirty word!')
    end
  end
end
