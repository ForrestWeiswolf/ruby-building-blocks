require "caesar"

describe "#caesar" do
	context "when given a shift of 0" do
		it "returns the plaintext" do
			expect(caesar("Hello, world.", 0)).to eql("Hello, world.")
		end
	end
	context "when given a shift of 2" do
		it "enciphers 'zZ' as 'bB'" do
			expect(caesar('zZ', 2)).to eql('bB')
		end
	end
end