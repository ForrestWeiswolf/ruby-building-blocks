def bubble_sort(list)
  pass = Proc.new do |l| 
    for i in (0..l.length-2) do
  	  if l[i] > l[i+1]
        puts "#{l[i]} > #{l[i+1]}"
    	  tmp = l[i]
    	  l[i] = l[i+1]
    	  l[i+1] = tmp
      end
    end
  end

  result = list
  pass.call(list)
  return result
end

puts bubble_sort([4,3,78,2,0,2]).inspect
