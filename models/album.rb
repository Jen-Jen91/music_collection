require_relative("../db/sql_runner.rb")

class Album

  attr_reader(:id, :artist_id)
  attr_accessor(:title, :genre)

  def initialize(options)
    @id = options["id"].to_i()
    @artist_id = options["artist_id"].to_i()
    @title = options["title"]
    @genre = options["genre"]
  end


  def save()
    sql = "
      INSERT INTO albums (
        artist_id,
        title,
        genre
      )
      VALUES ($1, $2, $3)
      RETURNING id;
    "
    values = [
      @artist_id,
      @title,
      @genre
    ]

    result = SqlRunner.run(sql, values)

    @id = result[0]["id"].to_i()
  end


  def self.all()
    sql = "SELECT * FROM albums;"

    results = SqlRunner.run(sql)

    albums = results.map do |album_hash|
      Artist.new(album_hash)
    end

    return albums
  end


  def artist()
    sql = "
      SELECT * FROM artists
      WHERE id = $1;
    "
    results = SqlRunner.run(sql, [@artist_id])

    artist = results.map do |artist_hash|
      Artist.new(artist_hash)
    end

    return artist
  end


  def self.delete_all()
    sql = "DELETE FROM albums;"
    SqlRunner.run(sql)
  end


  def delete()
    sql = "
      DELETE FROM albums
      WHERE id = $1;
    "
    SqlRunner.run(sql, [@id])
  end


  def update()
    sql = "
      UPDATE albums
      SET (
        artist_id,
        title,
        genre
      ) = ($1, $2, $3)
      WHERE id = $4;
    "
    values = [
      @artist_id,
      @title,
      @genre,
      @id
    ]
    SqlRunner.run(sql, values)
  end


  def self.find(id)
    sql = "
      SELECT * FROM albums
      WHERE id = $1
    "
    result = SqlRunner.run(sql, [id])

    album = Album.new(result[0])

    return album
  end


end
