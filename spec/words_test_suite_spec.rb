require_relative "../word_count"



describe Words do
  context "Raising errors" do
    it 'Throws an error if the file does not exist' do
      expect { Words.new("file_not_there.txt") }.to raise_error("There is no file called 'file_not_there.txt' at this location.")
    end
    it 'Throws an error if the file is not given in quotes' do
      expect { Words.new(no_quotes.txt) }.to raise_error(NameError)
    end
  end

  context "Screen display and prompts" do
    subject {described_class.new("test.txt")}
    it "Displays the correct screen information" do
      expect { subject.show_info }.to output(/NOTE: You can run this program by /).to_stdout
    end
    subject {described_class.new}
    it "Prompts for input if no file is provided initially" do
      expect { subject.show_info }.to output(/Paste a .txt file into the same folder /).to_stdout
    end
  end

  before    { File.write('testfile.txt', "Contents of test file") }
  context 'Check file content' do
    subject {described_class.new}
    it "Should open the file provided and read the contents" do
      expect(subject.open_file('testfile.txt')).to eq("Contents of test file")
    end
  end

end
