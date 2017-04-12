require "./word_count"
require "./get_file"

# Create a file object.
f = Inp_File.new
# Enter file name when prompted.
f.open_file
p f.text                        # Optional
# Create a word count object which receives the file object.
w = Words.new(f.text)
word_count = w.count_words
final_file = w.prepare_word_count(word_count)
w.display_word_count(final_file)


# The file is NOT provided in the initial instantiation of the "Inp_File" class.
