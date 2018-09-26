require("../db/sql_runner.rb")

class Album

  attr_reader(:id, :artist_id)
  attr_accessor(:title, :genre)

  def initialize(options)
    @id = options["id"].to_i()
    @artist_id = options["artist_id"].to_i()
    @title = options["title"]
    @genre = options["genre"]
  end




end
