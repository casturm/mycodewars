
def runoff(voters)
  results = voters.map(&:first).reduce({}) { |t,v| t[v] = (t[v] || 0) + 1; t }
  most_votes, least_votes = results.values.max, results.values.min
  winners = results.select { |k,v| v == most_votes }.keys
  losers = results.select { |k,v| v == least_votes }.keys
  reduced_ballots = voters.map do |voter|
    voter.delete_if { |can| losers.include?(can) }
  end
  winners.length == 1 ? winners.first : runoff(reduced_ballots)
end
