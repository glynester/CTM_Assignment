# WORD COUNT APPLICATION
The file that you wish to examine must be in the same directory as this application.

## Running the program
1) Path to file NOT supplied in initialization
Run the following code:  
```
words = Words.new
```
At the prompt, enter the name of a file, e.g. "file_name.txt"
```
text = open_file(file_inp)
word_count = count_words(text)
final_file = prepare_word_count(word_count)
display_word_count(final_file

```
1) Path to file IS supplied in initialization
```
words = Words.new("test.txt")
text = open_file(file_inp)
word_count = count_words(text)
final_file = prepare_word_count(word_count)
display_word_count(final_file

```
