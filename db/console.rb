require('pry')
require_relative('../models/album.rb')
require_relative('../models/artist.rb')

artist1 = Artist.new({'name' => 'AC/DC'})
artist1.save()
album1 = Album.new({'title' => 'Back in Black', 'genre' => 'Rock', 'artist_id' => artist1.id})

album1.save()
# p Album.all
# p Artist.all

p album1.artist
