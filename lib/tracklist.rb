class Musiclist
    def initialize
        @tracklist = []
    end

    def list_viewer
        @tracklist
    end
    
    def track_adder(track)
        @tracklist.push(track) if !@tracklist.include?(track)
    end

## Could elaborate by allowing a list of strings as an input and then
## altering the array output to make it one array, not an array of arrays.

end