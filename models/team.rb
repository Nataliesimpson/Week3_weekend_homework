require( 'pg' )
require( 'pry-byebug' )
require_relative('../db/sql_runner')
# require_relative('pokemon')

class Team 

  attr_reader( :id, :name )

  def initialize( options, runner )
    @id = options['id'].to_i
    @name = options['name']
    @runner = runner
  end

  def save()
    sql = "INSERT INTO teams (name) VALUES ('#{ @name }') RETURNING *"
    return Team.map_item(sql, @runner)
  end

  def self.all(runner)
    sql = "SELECT * FROM teams"
    return Team.map_items(sql, runner)
  end

  def self.delete_all(runner)
    sql = "DELETE FROM teams"
    runner.run(sql)
  end

  # def matches()
  #   sql = "SELECT m.* FROM matches m INNER JOIN teams t ON t.matches_id = t.id WHERE pokemon_id = #{@id}"
  #   return Trainer.map_items( sql, @runner )
  # end  

  def self.map_items(sql, runner)
    teams = runner.run( sql )
    result = teams.map { |team| Team.new( team, runner ) }
    return result
  end  

  def self.map_item(sql, runner)
    result = Team.map_items(sql, runner)
    return result.first
  end  









end  