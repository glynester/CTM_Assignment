require_relative "../get_file"

describe Inp_File do
  before do
    allow($stdout).to receive(:puts).and_return("")
  end

  context "Raising errors" do
    it 'Throws an error if the file does not exist' do
      expect { Inp_File.new("file_not_there.txt") }.to raise_error("There is no file called 'file_not_there.txt' at this location.")
    end
    it 'Throws an error if the file is not given in quotes' do
      expect { Inp_File.new(no_quotes.txt) }.to raise_error(NameError)
    end
    subject {described_class.new}
    it 'Handles the "this is a directory" exception when no file is provided.' do
      allow(subject).to receive(:prompt_user).and_return("")      # Line not working. Would stop test pausing for input if it worked.
      expect { subject.open_file }.to raise_error("There is no file called '' at this location.")
    end
  end

  before { File.write('mockedfile.txt', "A test file not a real file") }
  context "Screen display and prompts" do

    subject {described_class.new("mockedfile.txt")}
    it "Displays the correct screen information" do
      expect { subject.show_info }.to output(/NOTE: You can run this program by /).to_stdout
    end
    subject {described_class.new}
    it "Prompts for input if no file is provided initially" do
      expect { subject.show_info }.to output(/Paste a .txt file into the same folder /).to_stdout
    end
  end

  context 'Check file content' do
    subject {described_class.new 'mockedfile.txt'}
    it "Should open the file provided and read the contents" do
      subject.open_file
      expect(subject.text).to eq("A test file not a real file")
    end
  end

end
