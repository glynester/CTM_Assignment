require_relative "../word_count"

describe Words do
  before do
    allow($stdout).to receive(:puts).and_return("")
  end

  context 'Check file content' do
    it "should return a correct count of words" do
      w=described_class.new("A test file not a real file")
      expect(w.count_words).to include("file"=>2)
    end

    it "should correctly determine if a number is prime or not" do
      expect(subject.is_prime?(23456789)).to eq(true)
    end

    it "should add '(prime)' if the word count is prime" do
      w=described_class.new("A test file not a real file")
      word_count = w.count_words
      expect(w.prepare_word_count(word_count)).to include ('file => 2 (prime)')
    end

    it "should display the correct output on screen" do
      w=described_class.new("A test file not a real file")
      word_count = w.count_words
      final_file = w.prepare_word_count(word_count)
      expect { w.display_word_count(final_file) }.to output("a => 2 (prime)\nfile => 2 (prime)\nnot => 1\nreal => 1\ntest => 1\n").to_stdout
    end

  end

end
