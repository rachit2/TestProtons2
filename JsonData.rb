require 'net/http'
require 'json'
class A
	def self.score
		result = Net::HTTP.get(URI.parse('https://api.github.com/users/dhh/events/public'))
		dhh_score = 0 
		score_card = {
		"IssuesEvent" => 7,
		"IssueCommentEvent" => 6,
		"PushEvent" => 5,
		"PullRequestReviewCommentEvent" => 4,
		"WatchEvent" => 3,
		"CreateEvent" => 2,
		"Any other event" => 1 
		}
		(JSON.parse(result).group_by{|obj| obj["type"]}.map {|k,v| [k, v.length]}).each do |record|
			value = score_card.fetch(record[0]) rescue score_card.fetch("Any other event")
		  dhh_score += value * record[1]
  	end
		puts "DHH's github score is #{dhh_score}"
	end
end
A.score