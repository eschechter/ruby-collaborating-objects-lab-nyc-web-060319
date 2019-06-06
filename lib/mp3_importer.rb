class MP3Importer

    attr_accessor :path

    def initialize(file_path)
        @path = file_path 
    end

    def files
        Dir[@path + "/*.mp3"].map do |file|
            file.split('/')[4]
        end
    end

    def import
        file_set = self.files
        file_set.each do |file|
            Song.new_by_filename(file)
        end
    end
end 

puts MP3Importer.new('./spec/fixtures').import