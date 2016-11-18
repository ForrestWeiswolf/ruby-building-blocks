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

  def my_select
    result = []
    self.my_each do |item|
      if yield(item) == true
        result = result.push(item)
      end
    end
    return result
  end

  def my_all?
    result = true
    if block_given?
      self.my_each {|i| result = false unless yield(i)}
    else
      self.my_each{|i| result = false unless i}
    end
    return result
  end

end

puts %w[ant bear cat].my_all? { |word| word.length >= 3 }
puts %w[ant bear cat].my_all? { |word| word.length >= 4 }
puts [nil, true, 99].my_all?
puts [true, 99].my_all?
