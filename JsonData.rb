require 'net/http'
require 'json'
#require 'benchmark/ips'
class A
	def initialize
		@result = Net::HTTP.get(URI.parse('https://api.github.com/users/dhh/events/public'))
		@dhh_score = 0 
		@score_card = {
		"IssuesEvent" => 7,
		"IssueCommentEvent" => 6,
		"PushEvent" => 5,
		"PullRequestReviewCommentEvent" => 4,
		"WatchEvent" => 3,
		"CreateEvent" => 2,
		"Any other event" => 1 
		}
	end
	def calScore
		 JSON.parse(@result).each{|obj| @dhh_score+=@score_card.fetch(obj["type"],1) }
		return @dhh_score
	end
end
b=A.new
puts b.calScore
