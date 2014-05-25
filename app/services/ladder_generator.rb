class LadderGenerator

  def self.perform(tournament)
    round = 1
    tournament.teams.shuffle.each_slice(2) do |pair|
      tournament.matches << Match.create(tournament: tournament, host: pair[0], guest: pair[1], round: round)
    end

    counter = tournament.teams.count / 2
    loop do
      break if counter == 1
      counter /= 2
      round += 1
      counter.times { tournament.matches << Match.create(tournament: tournament, round: round) }
    end
 
  end
end
