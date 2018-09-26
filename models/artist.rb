require_relative("../db/sql_runner.rb")

class Artist

  attr_reader(:id)
  attr_accessor(:name)

  def initialize(options)
    @id = options["id"].to_i()
    @name = options["name"]
  end


  def save()

    sql = "
      INSERT INTO artists (name)
      VALUES ($1)
      RETURNING id;"

    values = [@name]

    result = SqlRunner.run(sql, values)

    @id = result[0]["id"].to_i()

  end


  def self.all()

    sql = "SELECT * FROM artists;"

    results = SqlRunner.run(sql)

    artists = results.map do |artist_hash|
      Artist.new(artist_hash)
    end

    return artists

  end


  def albums()

    sql = "
      SELECT * FROM albums
      WHERE artist_id = $1;"

    results = SqlRunner.run(sql, [@id])

    albums = results.map do |album_hash|
      Album.new(album_hash)
    end

    return albums

  end


  def self.delete_all()

    sql = "DELETE FROM artists;"

    SqlRunner.run(sql)

  end


  def update()

    sql = "
      UPDATE artists
      SET name = $1
      WHERE id = $2;"

    SqlRunner.run(sql, [@name, @id])

  end







end
