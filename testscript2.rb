require "./word_count"

words = Words.new
text = words.open_file
word_count = words.count_words(text)
final_file = words.prepare_word_count(word_count)
words.display_word_count(final_file)


# The file is NOT provided in the initial instantiation of the "Words" class.
