def stock_picker(prices)
  buy, sell = 0, 0
  prices.each_with_index do |p1, i|
    prices[i..-1].each do |p2|
      if p2-p1 > sell-buy
        buy, sell = p1, p2
      end
    end
  end
  if sell-buy > 0
    puts "Buy at $#{buy}, sell at $#{sell}, for a profit of $#{sell-buy}"
  else
    puts "Do not buy."
  end
end

stock_picker([17,3,6,9,15,8,6,1,10])
stock_picker([10, 9, 8, 9, 2])
stock_picker([4, 3, 3, 3])
