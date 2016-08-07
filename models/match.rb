# ID, home_team ID, away_team ID, home_team score, away_team score
require('pg')
require_relative('../db/sql_runner')

class Match

  attr_reader(:id, :home_team_id, :away_team_id, :home_team_score, :away_team_score )

  def initialize( options )
    @id = options['id'].to_i
    @home_team_id = options['home_team_id'].to_i
    @away_team_id = options ['away_team_id'].to_i
    @home_team_score = options['home_team_score'].to_i
    @away_team_id = options['away_team_score'].to_i
  end

  def save 
    sql = "INSERT INTO matches (home_team_id, away_team_id, home_team_score, away_team_score) VALUES ('#{@home_team_id}, #{@away_team_id}, #{@home_team_score}, {@away_team_score}) RETURNING *"
    match = SqlRunner.run( sql ).first
    @id = match['id'].to_i
  end

  def teams()
    sql = "SELECT teams * FROM teams WHERE id = #{@away_team_id} OR id = #{home_team_id};"
    teams = SqlRunner.run( sql )
    result = teams.map {|team| Team.new( team ) }
  end

    def self.all ()
      sql = "SELECT * FROM matches"
      matchs = SqlRunner.run(sql)
      result = matches.map { |match| Match.new( match ) }
      return result
    end

   def self.delete_all()
    sql = "DELETE FROM matches"
    SqlRunner.run(sql)
   end

  end