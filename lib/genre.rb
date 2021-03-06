class Genre
   extend Concerns::Findable
 
   attr_accessor :name, :songs
   @@all = []
 
   def initialize(name)
     @name = name
     @songs = []
   end
 
   def save
     @@all << self
   end

   def self.all
     @@all
   end

   def self.destroy_all
     self.all.clear
   end

   def self.create(name)
     genre = Genre.new(name)
     genre.save
     genre
   end

   def artists
     @songs.collect {|song| song.artist}.uniq
   end

   def add_song(song)
     @songs << song unless @songs.include?(song)
   end

 end
