class Artist

    attr_accessor :name, :songs

    @@all = []

    def initialize(name)
        @name = name   
        @songs = []
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def add_song(song)
        @songs << song
    end

    def self.find_or_create_by_name(artist_name)
        artist_hash = {}

        @@all.each do |artist|
            artist_hash[artist.name] = artist
        end

        if artist_hash.keys.include?(artist_name)
            return artist_hash[artist_name]
        else
            toRet = Artist.new(artist_name)
            toRet.save
            return toRet
        end
    end

    def print_songs
        @songs.each do |song|
            puts song.name
        end
    end
end