def make_snippet(str)
    str.split.length <= 5 ? str : "#{str.split.slice(0,5).join(" ")}..." 
end

def count_words(string)
    string.split.length
end

def read_time(text)
    "#{text.to_s.split.length/200.to_f}m"
end

def grammar_check(checkme)
    if checkme == ""
        fail "NOT VALID"
    elsif checkme[-1].match?(/[.?!]/) && checkme[0]==checkme[0].upcase 
        true 
    else
        false
    end
end

