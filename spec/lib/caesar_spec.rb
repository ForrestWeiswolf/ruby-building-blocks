require "caesar"

describe "#caesar" do
	context "when given a shift of 0" do
		it "returns the plaintext" do
			expect(caesar("Hello, world.", 0)).to eql("Hello, world.")
		end
	end

	it "preserves capitalization'" do
		expect(caesar('AaA', 2)).to eql('CcC')
	end

	it "doesn't change non-letter characters" do
		expect(caesar('!! ?? 55', 12)).to eql('!! ?? 55')
	end

	it "wraps around from the end of the alphabet when neccessary" do 
		expect(caesar('z', 2)).to eql('b')
	end
end