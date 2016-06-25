require( 'pg' )
require( 'pry-byebug' )
require_relative('../db/sql_runner')
# require_relative('pokemon')

class Match

  attr_reader( :id, :name )

  # CREATE TABLE matches (
  #   id SERIAL4 primary key,
  #   home_team_id INT4 references teams(id),
  #   away_team_id INT4 references teams(id),
  #   home_team_score INT2,
  #   away_team_score INT2 
  # );

  def initialize( options, runner )
    @id = options['id'].to_i
    @home_team_id = options['home_team_id'].to_i
    @away_team_id = options['away_team_id'].to_i
    @home_team_score = options['home_team_score'].to_i
    @away_team_score = options['away_team_score'].to_i
    @runner = runner
  end

#add home_team_id & away_team_id
  def save()
    sql = "INSERT INTO matches (home_team_id, away_team_id, home_team_score, away_team_score) VALUES ('#{ @home_team_id }', '#{ @away_team_id }', #{ @home_team_score}, #{@away_team_score}) RETURNING *"
    return Match.map_item(sql, @runner)
  end

  def self.all(runner)
    sql = "SELECT * FROM matches"
    return Match.map_items(sql, runner)
  end

  def self.delete_all(runner)
    sql = "DELETE FROM matches"
    runner.run(sql)
  end

  # def teams()
  #   sql = "SELECT t.* FROM trainers t INNER JOIN ownedpokemons o ON o.trainer_id = t.id WHERE pokemon_id = #{@id}"
  #   return Team.map_items( sql, @runner )
  # end  

  def self.map_items(sql, runner)
    matches = runner.run( sql )
    result = matches.map { |match| Match.new( match, runner ) }
    return result
  end  

  def self.map_item(sql, runner)
    result = Match.map_items(sql, runner)
    return result.first
  end  

end




