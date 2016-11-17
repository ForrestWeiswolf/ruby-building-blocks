module Enumerable
  def my_each_with_index
    for i in (0...self.length) do
      yield(self[i], i)
    end
  end

  def my_each
    self.my_each_with_index do |item, index|
      yield(item)
    end
  end
  
end

ary = [4, 5, 6]
ary.my_each do |num|
  puts num*2
end
