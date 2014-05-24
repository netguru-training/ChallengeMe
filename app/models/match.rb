class Match
  include Mongoid::Document
  include Mongoid::Timestamps

  has_one :tournament
end
