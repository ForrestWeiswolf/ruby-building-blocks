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

  def my_any?
    result = false
    if block_given?
      self.my_each {|i| result = true if yield(i)}
    else
      self.my_each{|i| result = true if i}
    end
    return result
  end

  def my_none?
    !(self.my_any?)
  end

  def my_count(obj=nil)
    result = 0
    if !(obj == nil)
      self.my_each do |i|
        result +=1 if i == obj
      end
    elsif block_given?
      self.my_each do |i|
        result +=1 if yield(i)
      end
    else
      result = self.length
    end
    return result
  end

end

ary = [1, 2, 4, 2]
puts ary.my_count
puts ary.my_count(2)
puts ary.my_count{ |x| x%2==0 }
