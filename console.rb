require_relative('./models/team')
require_relative('./models/match')
require_relative('./db/sql_runner')

require( 'pry-byebug' )

runner = SqlRunner.new({dbname: 'dodgeball_league', host: 'localhost'})

# Team.delete_all(runner)
# Match.delete_all(runner)

team1 = Team.new({'name' => 'Ballin'}, runner)
t1 = team1.save
team2 = Team.new({'name' => 'The Dodgefathers'}, runner)
t2 = team2.save
team3 = Team.new({'name' => 'Daj Mabal'}, runner)
t3 = team3.save
team4 = Team.new({'name' => 'The Mother Duckers'}, runner)
t4 = team4.save
# team5 = Team.new({'name' => 'Dodger Moore'}, runner)
# t5 = team5.save


match1 = Match.new({'home_team_id' => t1.id, 'away_team_id' => t2.id, 'home_team_score' => '1', 'away_team_score' => '2'}, runner)
m1 = match1.save
match2 = Match.new({'home_team_id' => t3.id, 'away_team_id' => t4.id, 'home_team_score' => '0', 'away_team_score' => '0'}, runner)
m2 = match2.save
match3 = Match.new({'home_team_id' => t2.id, 'away_team_id' => t3.id, 'home_team_score' => '3', 'away_team_score' => '1'}, runner)
m3 = match3.save
match4 = Match.new({'home_team_id' => t1.id, 'away_team_id' => t4.id, 'home_team_score' => '4', 'away_team_score' => '2'}, runner)
m4 = match4.save


binding.pry
nil



