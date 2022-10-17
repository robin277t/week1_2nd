# File: lib/diary.rb
class Diary
    def initialize
        @entries = []
    end
  
    def add(entry) # entry is an instance of DiaryEntry
      # Returns nothing
      @entries.push(entry)
    end
  
    def all
      # Returns a list of instances of DiaryEntry
        @entries
    end
  
    def count_words
      # Returns the number of words in all diary entries
      # HINT: This method should make use of the `count_words` method on DiaryEntry.
      return @entries.sum(&:count_words)
    end
  
    def reading_time(wpm) # wpm is an integer representing
                          # the number of words the user can read per minute
      # Returns an integer representing an estimate of the reading time in minutes
      # if the user were to read all entries in the diary.
      (count_words/wpm.to_f).ceil
    end
  
    def find_best_entry_for_reading_time(wpm, minutes)
          # `wpm` is an integer representing the number of words the user can read
          # per minute.
          # `minutes` is an integer representing the number of minutes the user
          # has to read.
      # Returns an instance of diary entry representing the entry that is closest 
      # to, but not over, the length that the user could read in the minutes they
      # have available given their reading speed.

            new_arr = []
            @entries.each do |thing|
                if thing.count_words < (wpm * minutes)
                    new_arr.push(thing.count_words)
                else
                    next
                end
            end
            if new_arr == []
                fail "nothing short enough"
            else
                @entries.select {|title| title.count_words == new_arr.max}
            end
    end
  
end

  # File: lib/diary_entry.rb 
  class DiaryEntry
    def initialize(title, contents) # title, contents are strings
      @title = title
      @contents = contents.to_s
      @start = 0
    end
  
    def title
      @title
    end
  
    def contents
      @contents
    end
  
    def count_words
      # Returns the number of words in the contents as an integer
      @contents.split.length
    end
  
    def reading_time(wpm) # wpm is an integer representing
                          # the number of words the user can read per minute
      # Returns an integer representing an estimate of the reading time in minutes
      # for the contents at the given wpm.
      (count_words/wpm.to_f).ceil
    end
  
    def reading_chunk(wpm, minutes) # `wpm` is an integer representing the number
                                    # of words the user can read per minute
                                    # `minutes` is an integer representing the
                                    # number of minutes the user has to read
      # Returns a string with a chunk of the contents that the user could read
      # in the given number of minutes.
      # If called again, `reading_chunk` should return the next chunk, skipping
      # what has already been read, until the contents is fully read.
      # The next call after that it should restart from the beginning.

      @start !=0 ? i1 = @start : i1 = 0
      chunk = (minutes.to_f * wpm.to_f).ceil
      if @start >= (@contents.split.length)
        @start = 0
        i1 = 0
      else 
        @start += chunk
      end
      @contents.split.slice(i1,chunk).join(" ")
    end
  end
