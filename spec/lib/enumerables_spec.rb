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
end