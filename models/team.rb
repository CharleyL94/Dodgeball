# ID and Name
require('pg')
require_relative('../db/sql_runner')

class Team

attr_reader(:id, :name)

def initialize( options )
  @id = options['id'].to_i
  @name = options['name']
end

def save()
  sql = "INSERT INTO teams (name) VALUES ('#{@name}') RETURNING *"
  pokemon = SqlRunner.run( sql ).first
  @id = pokemon['id'].to_i
end

def match()
  sql = "SELECT matches * FROM matches WHERE home_team_id = #{@id} OR away_team_id = #{@id};"
  match = SqlRunner.run( sql )
  resuly = match.map {|match| Match.new(match)}
  return result
end

def save.all()
  sql = "SELECT * FROM teams"
  teams = SqlRunner.run(sql)
  result = teams.map {|team| Team.new(team)}
  return result
end

def self.delete_all()
  sql = "DELETE FROM teams"
  SqlRunner.run(sql)
end


end