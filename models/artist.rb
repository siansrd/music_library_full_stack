require ('pg')
# This gets everything back from db as an array
require_relative('../db/sql_runner')
require_relative('./album')

class Artist


  attr_reader( :id, :name )

  def initialize(options)
    @id = options['id'].to_i
    @name = options ['name']
  end
  # the options hash is defined as values gets passed in 
  # artist1 = artist.new( { name: 'Justin Bieber' } )


  def save
    sql = "INSERT INTO artists ( name ) VALUES ( '#{ @name }' ) RETURNING *;"
    # SQL statement. The RETURNING * returns all of the row. This is part of the CREATE process (Crud). Different from SELECT is part of the READ.
    artist = SqlRunner.run( sql ).first
    # The .first takes the row as a hash our of the postress array. Makes it more useful to work on.
    @id = artist['id'].to_i
    # This gets the id that is created by the database and reasigns it to the artists id, so we don't need to create an id manually.
  end

  # List albums associated by one artist
  def albums
    sql = "SELECT * FROM albums WHERE artist_id = #{@id};"
    #Select all from albums when the id of the artist we are working on matched the artist_id in albums
    album_list = SqlRunner.run( sql )
    # Save the array to a varibale
    return album_list.map { |album| Album.new(album) }
    # Map the array to a hash.
  end


  def self.delete( id )
    sql = "DELETE FROM artists WHERE id = #{id}"
    SqlRunner.run( sql )
  end


  def self.update( options )
    sql = "UPDATE artists SET 
      name='#{ options['name'] }' 
      WHERE id=#{ options['id'] }"
    SqlRunner.run( sql )
  end

  def self.find(id)
    sql = "SELECT * FROM artists WHERE id = #{id}"
    artist = SqlRunner.run( sql ).first
    return Artist.new( artist )
  end


  def self.all() #or Artist.all
    sql = "SELECT * FROM artists;"
    all_artists = SqlRunner.run( sql )
    result = all_artists.map { |artist| Artist.new( artist ) }
    return result
  end

  def self.find( id )
    sql = "SELECT * FROM artists WHERE id = #{id}";
    artist = SqlRunner.run( sql ).first
    return Artist.new( artist )
  end

  
end

