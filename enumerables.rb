module Enumerable
  def my_each_with_index
    for i in (0...self.size) do
      yield(self.to_a[i], i)
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
    #Docs say "If no block is given, an Enumerator is returned instead", which I don't know how to implement
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
    #Putting conditionals outside the loops here is less DRY (two similar my_each blocks are needed), but should be more efficient since each condition only needs to be evaluated once.
    #Should see if there's a way to structure it that has both advantages
    if !(obj == nil)
      self.my_each do |i|
        result +=1 if i == obj
      end
    elsif block_given? #not sure how to handle the case where there's both an argument and a block
      self.my_each do |i|
        result +=1 if yield(i)
      end
    else
      result = self.length
    end
    return result
  end

  def my_map
    result = []
    if block_given?
      self.my_each do |i|
        result.push yield(i)
      end
    end
    #Docs say "If no block is given, an Enumerator is returned instead", which I don't know how to implement
    return result
  end

end

puts (1..4).my_map { |i| i*i }