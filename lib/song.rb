class Song
    attr_accessor :artist, :name

    def initialize(name)
        @name = name
    end

    def self.new_by_filename(file_name)
        artist_name = file_name.split(' - ')[0]
        name = file_name.split(' - ')[1]
        new_song = self.new(name)
        new_song.make_artist(artist_name)
        return new_song
    end

    def make_artist(artist_name)
        artist = Artist.find_or_create_by_name(artist_name)
        artist.add_song(self)
        @artist = artist
    end
end