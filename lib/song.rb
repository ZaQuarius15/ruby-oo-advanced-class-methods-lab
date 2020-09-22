require 'pry'

class Song

  attr_accessor :name, :artist_name

  @@all = []

  def self.all
    @@all 
  end

  def save
    @@all << self
  end

  def self.create
    song = self.new
    @@all << song
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
    @@all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
      if Song.find_by_name(name)
        Song.find_by_name(name)
      else
        Song.create_by_name(name)
      end
  end

  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    split_file = filename.split(/[-.]/)
    song = self.new
    song.name = split_file[1].strip
    song.artist_name = split_file[0].strip
    song
  end



  def self.create_from_filename(filename)
    split_file = filename.split(/[-.]/)
    song = self.new
    song.name = split_file[1].strip
    song.artist_name = split_file[0].strip
    @@all << song
    song
  end

  def self.destroy_all
    @@all = []
  end


end
