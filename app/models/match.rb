class Match
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :tournament

  field :host_score, type: Integer
  field :guest_score, type: Integer

  field :round, type: Integer, default: 1

  belongs_to :host, :class_name => 'Team'
  belongs_to :guest, :class_name => 'Team'

  def winner
    host_score > guest_score ? (return host) : (return guest)
  end
end
