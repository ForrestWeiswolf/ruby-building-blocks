def bubble_sort_by(list)
  result = list
  sorted = false
  until sorted
    sorted = true
    for i in (0..result.length-2) do
  	  if yield(result[i], result[i+1]) > 0
    	  result[i], result[i+1] = result[i+1], result[i]
        sorted = false
      end
    end
  end
  return result
end

def bubble_sort(list)
  bubble_sort_by(list) do |left, right|
    left-right
  end
end


sorted_greetings =  bubble_sort_by(["hi","hello","hey"]) do |left,right|

  left.length - right.length

end

puts sorted_greetings.inspect

puts bubble_sort([4,3,78,2,0,2]).inspect

