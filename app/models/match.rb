class Match
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :tournament
end
