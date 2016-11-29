class Board
	def initialize(grid = [])
		@grid = grid
		3.times {@grid.push(Array.new(3))} if @grid == []
	end

	def won?
		#untested, doesn't account for diagonals, etc.
		result = false
		@grid.each do |row| 
			result = "X" if row.all? {|square| square == "X"}
			result = "Y" if row.all? {|square| square == "Y"}
		end
		#@grid.each do |col|
		#	result = "X" if @grid.all?{|row| row[col] == "X"}
		#	result = "Y" if @grid.all?{|row| row[col] == "Y"}
		#end
		return result
	end

	def play(side)
	end

	def to_s
		result = ""
		@grid.each do |row|
			result = result + row.inspect + "\n"
		end
		return result
	end

	private 
	def occupied?(square)
	end
end

b1 = Board.new ([["X", nil, nil], [nil, nil, nil], ["Y", "Y", nil]])
b2 = Board.new ([["X", nil, nil], ["X", nil, nil], ["X", "Y", nil]])
b3 = Board.new ([["Y", "Y", "Y"], [nil, nil, nil], ["Y", "Y", nil]])
puts b1.won?
puts b2.won?
puts b3.won?