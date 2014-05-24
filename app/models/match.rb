class Match
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :tournament

  belongs_to :host, :class_name => 'Team'
  belongs_to :guest, :class_name => 'Team'
end
