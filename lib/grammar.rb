class GrammarStats
    def initialize
      @runs = 0
      @correct = 0
    end
  
    def check(text) # text is a string
      # Returns true or false depending on whether the text begins with a capital
      # letter and ends with a sentence-ending punctuation mark.
        if text == ""
            fail "NOT VALID"
        elsif text[-1].match?(/[.?!]/) && text[0]==text[0].upcase  
            @runs += 1
            @correct += 100
            true
        else
            @runs += 1
            false
        end
    end

    def percentage_good
      # Returns as an integer the percentage of texts checked so far that passed
      # the check defined in the `check` method. The number 55 represents 55%.
        @correct/@runs.to_f.ceil
    end
  end

