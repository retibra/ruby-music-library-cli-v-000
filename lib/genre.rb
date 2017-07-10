class Genre
  extend Concerns::Findable
  attr_accessor :name

@@all = []

  def initialize(name)
    @name = name
    @songs = []
  end


  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    new(name).tap {|genre| genre.save}
  end

  def songs
    @songs
  end

  def artists
    songs.collect do |song|
      song.artist
    end.uniq
  end

end
