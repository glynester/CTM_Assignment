require "./lib/word_count";
require "./lib/get_file";

# Create a file object and provide the file.
f = Inp_File.new("test.txt");
f.open_file;
p f.text;                        # Optional
# Create a word count object which receives the file object
w = Words.new(f.text);
word_count = w.count_words;
final_file = w.prepare_word_count(word_count);
w.display_word_count(final_file);


# The file is provided in the initial instantiation of the "Inp_File" class.
