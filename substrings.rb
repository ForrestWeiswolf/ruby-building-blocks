# coding: utf-8
def substrings(str, dict)
  result = {}
  dict.each do |word|
    count = str.scan(word).length
    result[word] = count unless count == 0
  end
  return result
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

puts substrings("Howdy partner, sit down! How's it going?", dictionary)
