require "enumerables"

describe Enumerable do 
	let(:an_enumerable) do
		[1, 1, 1, 1, 2, 1, 1, 3, 3, 1, 1, 4, 6, 4]
	end

	describe ".my_select" do
		context "when called on an empty list" do
			it "returns an empty list" do
				expect([].my_select{|i| true}).to eql([])
			end
		end

		context "when passed a block that only returns false" do
			it "returns an empty list" do #actually they aren't all lists, are they? this may be a mistake.
				expect(an_enumerable.my_select{|i| false}).to eql([])
			end
		end
		context "when passed a block that only returns true" do
			it "returns self unchanged" do
				expect(an_enumerable.my_select{|i| true}).to eql(an_enumerable)
			end
		end

		it "selects the items in self for which its block is true" do
			expect(an_enumerable.my_select{|i| i > 3}).to eql([4, 6, 4])
		end

		context "when not called by an enumerable" do
			it "raises an error" do
				expect { 1.my_select{|i| true} }.to raise_error(NoMethodError)
			end
		end
	end

	describe ".my_all?" do
		context "when called on an empty list" do #is there some way to make this DRYer?
			it "returns true" do
				expect([].my_all?{|i| true}).to eql(true)
			end
		end

		context "when passed a block that only returns false" do
			it "returns false" do
				expect(an_enumerable.my_all?{|i| false}).to eql(false)
			end
		end
		context "when passed a block that only returns true" do
			it "returns true" do
				expect(an_enumerable.my_all?{|i| true}).to eql(true)
			end
		end

		context "when block is true for every member of self" do
			it "returns true" do
				expect(an_enumerable.my_all?{|i| i<100}).to eql(true)
			end
		end

		context "when block is false for some member of self" do
			it "returns false" do
				expect(an_enumerable.my_all?{|i| i<5}).to eql(false)
			end
		end

		context "when no block is given" do
			context "when called by a list of truthy values" do
				it "returns true" do
					expect(an_enumerable.my_all?).to eql(true)
				end
			end
			context "when called by a list containing false or nil" do
				it "returns false" do
					expect([true, false].my_all?).to eql(false)
					expect([1, 1, nil].my_all?).to eql(false)
				end
			end
		end

		context "when not called by an enumerable" do
			it "raises an error" do
				expect { 1.my_all?{|i| true} }.to raise_error(NoMethodError)
			end
		end
	end
end