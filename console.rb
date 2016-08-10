require_relative( './models/album' )
require_relative( './models/artist')
require( 'pry-byebug' )



artist1 = Artist.new( { 'name' => 'Oasis' } )
artist1.save()

album1 = Album.new( { 'name' => 'Wonder Wall', 'artist_id' => artist1.id  } )
album1.save()



nil