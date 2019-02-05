require_relative('./models/album.rb')
require_relative('./models/artist.rb')

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({
  "name" => "GreenDay"
  })

artist2 = Artist.new({
  "name" => "Steps"
  })

artist3 = Artist.new({
  "name" => "Queen"
  })

artist1.save()
artist2.save()
artist3.save()

album1 = Album.new({
  "artist_id" => artist1.id,
  "title" => "American Idiot",
  "genre" => "rock"
  })

album2 = Album.new({
  "artist_id" => artist2.id,
  "title" => "Gold",
  "genre" => "pop"
  })

album3 = Album.new({
  "artist_id" => artist2.id,
  "title" => "Step One",
  "genre" => "pop"
  })

album1.save()
album2.save()
album3.save()

artist1.name = "Green Day"
artist1.update()

album2.genre = "90s pop"
album2.update()
