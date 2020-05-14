require 'pry'
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
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save

    song
  end

  def self.find_by_name(name)
      self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }  
  end
  
  def self.new_from_filename(filename)
    #removing the .mp3 suffix and splitting the string 
    song_details_array = filename.delete_suffix('.mp3').split(" - ")
    artist_name = song_details_array[0]
    song_name = song_details_array[1]

    song = self.new_by_name(song_name)
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(name)
    song = self.new_from_filename(name)
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
