module FunWithStrings
  def palindrome?
    # your code here
    s = self.downcase.gsub(/\W/,'')
    s == s.reverse
  end
  def count_words
    # your code here
    dict = Hash.new(0)
    self.downcase.gsub(/[^a-z ]/,'').split(' ').each { |word|
      dict[word] += 1
    }
    dict
  end
  def anagram_groups
    # your code here
    ana = Hash.new([])
    self.split(' ').each{ |word|
      process_word = word.downcase.chars.sort.join
      if ana.key?(process_word)
        ana[process_word].push(word)
      else
        ana[process_word] = [word]
      end
    }
    ans = []
    ana.each { |key,value|
      ans.push(value)
    }
    ans
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end


# puts 'A man, a plan, a canal -- Panama'.palindrome?
['scream cars for four scar creams'].each do |s|
  puts s.anagram_groups.inspect
end

puts [12,123,12].inspect