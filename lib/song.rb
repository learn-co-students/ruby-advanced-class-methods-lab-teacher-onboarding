class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  # begin my code!

  def self.create
    Song.all << self.new
    Song.all[-1]
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    @@all << self.new_by_name(name)
    @@all[-1]
  end

  def self.find_by_name(name)
    songs_by_name = @@all.each do |song|
      # binding.pry
      if song.name == name
        return song
      end
    end
    if songs_by_name.length == 0
      return nil
    end
  end

  def self.find_or_create_by_name(name)
    Song.find_by_name(name) ? Song.find_by_name(name) : Song.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    filename_array = filename.split(/\.|( - )/)
    # binding.pry
    song_name = filename_array[2]
    artist_name = filename_array[0]

    new_song = self.new
    new_song.name = song_name
    new_song.artist_name = artist_name
    new_song
  end

  def self.create_from_filename(filename)
    @@all << Song.new_from_filename(filename)
    @@all[-1]
  end

  def self.destroy_all
    @@all.clear
  end

end
