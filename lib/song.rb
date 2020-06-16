class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find { |song|
      song.name == name
    }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort {|song_a, song_b| song_a.name <=> song_b.name}
  end

  def self.new_from_filename filename
    song_details = split_filename(filename)
    song = Song.new
    song.artist_name = song_details[:artist_name]
    song.name = song_details[:song]
    song
  end

  def self.create_from_filename filename
    song = self.new_from_filename(filename)
    song.save
  end

  def self.destroy_all
    @@all = []
  end

  private

  def self.split_filename filename
    path = filename.split(".")[0]
    song_details = path.split(" - ")
    {
      :artist_name => song_details[0],
      :song => song_details[1]
    }
  end

end
