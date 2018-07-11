require_relative('../db/sql_runner')

class Album
  def initialize(options)
    @id = options["id"] if options["id"].to_i
    @title = options["title"]
    @genre  = options["genre"]
    @artist_id = options["artist_id"].to_i
  end

  def artist
    sql = "SELECT * FROM artists WHERE id = $1;"
    values = [@artist_id]
    results = SqlRunner.run(sql, values)
    artist_hash = results.first
    artist = Artist.new(artist_hash)
   return artist
  end

  def save
    sql = "INSERT INTO albums (title, genre, artist_id) VALUES ($1, $2, $3) RETURNING id;"
    values = [@title, @genre, @artist_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

  def self.all
    sql = "SELECT * FROM albums"
    albums = SqlRunner.run(sql)
    return albums.map { |album_hash|
    Album.new(album_hash)}
  end

end
