require_relative('./models/album.rb')
require_relative('./models/artist.rb')
require('pry')

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({
  "name" => "GreenDay"
  })

artist1.save()

artist2 = Artist.new({
  "name" => "Steps"
  })

artist2.save()

album1 = Album.new({
  "artist_id" => artist1.id,
  "title" => "American Idiot",
  "genre" => "rock"
  })

album1.save()

album2 = Album.new({
  "artist_id" => artist2.id,
  "title" => "Gold",
  "genre" => "pop"
  })

album2.save()

album3 = Album.new({
  "artist_id" => artist2.id,
  "title" => "Step One",
  "genre" => "pop"
  })

album3.save()

artist1.name = "Green Day"
artist1.update()

album2.genre = "90s pop"
album2.update()

artists = Artist.all()
albums = Album.all()

binding.pry
nil
