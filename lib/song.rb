require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    new_song = self.new
    @@all << new_song 
    return new_song
  end

  def self.all
    @@all
  end

  def self.new_by_name(name)
    @name = name
    new_song = self.new
    new_song.name = name
    
    return new_song
  end

  def self.create_by_name(name)
    @name = name
    new_song = self.new
    new_song.name = name
    @@all << new_song
    return new_song
  end

  def self.find_by_name(name)
    all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
     
    self.find_by_name(name) !=nil ? self.find_by_name(name) : self.create_by_name(name)
    
  end

  def self.alphabetical
    all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    data = filename.split(" - ")
    artist = data[0]
    song = data[1].split(".")
    title = song[0]
    new_song = self.new
    new_song.name = title
    new_song.artist_name = artist
    @@all << new_song
    return new_song
   
  end

  def self.create_from_filename(filename)
    data = filename.split(" - ")
    artist = data[0]
    song = data[1].split(".")
    title = song[0]
    new_song = self.new
    new_song.name = title
    new_song.artist_name = artist
    @@all << new_song
    return new_song
  end

  def self.destroy_all
    @@all = []
  end

  def save
    self.class.all << self
  end

end
