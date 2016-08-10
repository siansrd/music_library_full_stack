require('sinatra')
require('sinatra/contrib/all')
require_relative('./models/artist')
require_relative('./models/album')
require('pry-byebug')


# HOME 
get '/sounds' do
  erb (:home)
end

##ARTISTS##

# INDEX - ARTISTS
get '/artists' do
  @artists = Artist.all()
  erb (:'artists/index')
end


# NEW - ARTIST
get '/artists/new' do
  erb (:'artists/new')
end


# CREATE - ARTIST
post '/artists' do
  @artist = Artist.new(params)
  @artist.save
  erb (:'artists/create')
end

# EDIT - ARTIST
# FORM & FIND
get '/artists/:id/edit' do
  @artist = Artist.find (params[:id])
  erb (:'artists/edit')
end


# UPDATE - ARTIST
# POST
post '/artists/:id' do
  Artist.update( params )
# Where is this artist coming from?
  redirect(to( "/artists"))
end






## ALBUMS


# NEW - ALBUMS
get '/albums/new' do
  @artists = Artist.all()
  erb (:'albums/new')
end


# CREATE - ALBUM
post '/albums' do
  @album = Album.new(params)
  @album.save
  erb (:'albums/create')
end







