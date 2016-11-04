def caesar(str, shift)
	str.split("").map{ |l| encryptLetter(l, shift) }.join
end

def encryptLetter(l, shift)
  charCode = l.ord
  if charCode > 65 && charCode < 91
    return ((charCode-65+shift)%26 + 65).chr
  elsif charCode > 97 && charCode < 123
    return ((charCode - 97 + shift)%26 + 97).chr
  else
    return charCode.chr
  end
end

puts caesar("Mort, O mild friend.", 12)

