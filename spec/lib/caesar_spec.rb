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

	context "when passed too few arguments" do
		it "raises an error" do
			expect{ caesar()}.to raise_error()
			expect{ caesar(1)}.to raise_error()
		end
	end

	context "when passed too many arguments" do
		it "raises an error" do
			expect{ caesar("asd", 1, 1)}.to raise_error()
		end
	end

	context "when arguments are the wrong type" do
		it "raises an error" do
			expect{ caesar(1, 2)}.to raise_error()
			expect{ caesar('asd', true)}.to raise_error()
		end
	end
end