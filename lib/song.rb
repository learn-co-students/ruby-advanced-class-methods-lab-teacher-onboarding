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

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    @@all.find{|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      return self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end
  
  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    song = self.new
    parsed_filename = filename.delete_suffix(".mp3")
    split_filename = parsed_filename.split(" - ")
    song.artist_name = split_filename[0]
    song.name = split_filename[1]
    song
  end

  def self.create_from_filename(filename)
    song = self.create
    parsed_filename = filename.delete_suffix(".mp3")
    split_filename = parsed_filename.split(" - ")
    song.artist_name = split_filename[0]
    song.name = split_filename[1]
    song
  end

  def self.destroy_all
    @@all.clear
  end
end
