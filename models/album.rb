require( 'pg' )
require_relative( '../db/sql_runner' )

class Album

  attr_reader( :id, :artist_id, :name )

  def initialize(options)
    @id  = options['id'].to_i
    @artist_id = options['artist_id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO albums (name, artist_id) VALUES ( '#{@name}', '#{@artist_id}' ) RETURNING *;"
    album = SqlRunner.run( sql ).first
    @id = album['id'].to_i
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = #{@artist_id};"
    artist = SqlRunner.run( sql ).first
    Artist.new( artist )
  end

 

  

end