def caesar(str, shift)
	str.split("").collect{ |l| encryptLetter(l, shift) }.join
end

def encryptLetter(l, shift)
  charCode = l.ord
  if charCode > 65 && charCode < 91
    ((charCode-65+shift)%26 + 65).chr
  elsif charCode > 93 && charCode < 123
    ((charCode-93+shift)%26 + 93).chr
  else
    charCode.chr
  end
end

puts "t".ord
puts "t".ord-93+5
puts ("t".ord-93+5)%26 + 93
puts (("t".ord-93+5)%26 + 93).chr
puts "u".ord
puts "u".ord-93+5
puts ("u".ord-93+5)%26 + 93
puts (("u".ord-93+5)%26 + 93).chr
puts "s".ord
puts "s".ord-93+5
puts ("s".ord-93+5)%26 + 93
puts (("s".ord-93+5)%26 + 93).chr
puts caesar("Zebra", 1)
puts caesar("What a string!", 5)

