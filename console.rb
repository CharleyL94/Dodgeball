require_relative('models/match')
require_relative('models/team')
require('pry-byebug')

Match.delete_all()
Team.delete_all()

team1 = Team.new( {'name' => 'Jammy Dodgers'} )
team2 = Team.new( {'name' => 'Dodge ems'} )
team3 = Team.new( {'name' => 'Gotta dodge em all'} )


team1.save
team2.save
team3.save

match1 = Match.new({'home_team_id' => team1.id, 'away_team_id' => team2.id, 'home_team_score' => 10, away_team_score => 5})
match2 = Match.new({'home_team_id' => team1.id, 'away_team_id' => team3.id, 'home_team_score' => 20, away_team_score => 18})
match3 = Match.new({'home_team_id' => team2, 'away_team_id' => team3.id, 'home_team_score' => 8, away_team_score => 8})

match1.save
match2.save
match3.save

binding.pry
nil