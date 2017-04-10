require_relative "../word_count"

describe Words do
  context "Raising errors" do
    it 'throws an error if the file does not exist' do
      expect { Words.new("file_not_there.txt") }.to raise_error("There is no file called 'file_not_there.txt' at this location.")
    end
    it 'throws an error if the file is not given in quotes' do
      expect { Words.new(no_quotes.txt) }.to raise_error(NameError)
    end
  end

  context "Screen display" do
    subject {described_class.new("test.txt")}
    it "Displays the correct screen information" do
      expect { subject.show_info }.to output(/NOTE: You can run this program by /).to_stdout
    end
  end

end
