require('sinatra')
require('sinatra/contrib/all')
require_relative('./models/artist')
require_relative('./models/album')
require('pry-byebug')


# HOME 
get '/sounds' do
  erb (:home)
end


# INDEX - ARTISTS
get '/artists' do
  @artists = Artist.all()
  erb (:'artists/index')
end


# NEW - ARTISTS
get '/artists/new' do
  erb (:'artists/new')
end


# CREATE - ARTISTS
post '/artists' do
  @artist = Artist.new(params)
  @artist.save
  erb (:'artists/create')
end


# NEW - ALBUMS
get '/albums/new' do
  @artist = Artist.all()
  binding.pry
  erb (:'albums/new')
end





