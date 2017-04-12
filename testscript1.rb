require "./word_count"
require "./get_file"

f = Inp_File.new("test.txt")
f.open_file
p f.text
w = Words.new(f.text)
word_count = w.count_words
final_file = w.prepare_word_count(word_count)
w.display_word_count(final_file)



# words = Words.new("test.txt")
# text = words.open_file
# word_count = words.count_words(text)
# final_file = words.prepare_word_count(word_count)
# words.display_word_count(final_file)


# The file is provided in the initial instantiation of the "Words" class.
