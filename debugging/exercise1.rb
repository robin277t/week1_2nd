=begin

def say_hello(name)
    return "hello #{name}"
end


def encode(plaintext, key)
    cipher = key.chars.uniq + (('a'..'z').to_a - key.chars)
    #cipher = (('a'..'z').to_a - key.chars)
    ciphertext_chars = plaintext.chars.map do |char|
      (65 + cipher.find_index(char)).chr
    end
    return ciphertext_chars.join
  end
  
  def decode(ciphertext, key)
    cipher = key.chars.uniq + (('a'..'z').to_a - key.chars)
    plaintext_chars = ciphertext.chars.map do |char|
      cipher[char.ord - 65]
    end
    return plaintext_chars.join
  end
  
  # Intended output:
  #
  # > encode("theswiftfoxjumpedoverthelazydog", "secretkey")
  # => "EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL"
  #
  # > decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")
  # => "theswiftfoxjumpedoverthelazydog"
=end


  def get_most_common_letter(text)
    text.gsub!(/[^[:alpha:]]/, '').downcase!
    counter = Hash.new(0)
    text.chars.each do |char|
      counter[char] += 1
    end
    #print counter
    counter.to_a.sort_by { |k, v| -v }[0][0]
  end
  
  print get_most_common_letter("the roOf, the roOf, the roOf is On fire!")

  # Intended output:
  # 
  # > get_most_common_letter("the roof, the roof, the roof is on fire!")
  # => "o"