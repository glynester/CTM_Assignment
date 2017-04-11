# WORD COUNT APPLICATION
This application outputs the individual words that appear in a given text file and how many times that word appears in the text file.  

If the number of times each word appears is a prime number this is indicated.  

## Running the program
Load the file that you wish to examine in the same directory as this application.  
Then choose one of the 3 methods below.

## A) Running the program using the provided script files
There are 2 ways to run this application:
1) File IS supplied in initialization of class.  
From the command line, type:   
```
ruby testscript1.rb

```

2) File is NOT supplied in initialization of class.  
From the command line, type:   
```
ruby testscript2.rb

```
At the prompt, enter the name of the file to check, for example:   
file_name.txt   

## B) Running the program directly from irb
1) File IS supplied in initialization of class.
From the command line, type
```
irb
require './word_count.rb'

Then enter each of the commands from testscript1.rb (either individually or all together).
```

2) File is NOT supplied in initialization of class.
From the command line, type
```
irb
require './word_count.rb'
words = Words.new
```
Manually enter the name of the file.
```
Then enter the REMAINING commands from testscript2.rb
```

## C) Running the program directly from the command line
1) File IS supplied in initialization of class.
Run the following command:  
```
ruby -r './word_count.rb' -e "words = Words.new('test.txt'); text = words.open_file; word_count = words.count_words(text); final_file = words.prepare_word_count(word_count); words.display_word_count(final_file)"
```
2) File is NOT supplied in initialization of class.  
Run the following command:  
```
ruby -r './word_count.rb' -e "words = Words.new; text = words.open_file; word_count = words.count_words(text); final_file = words.prepare_word_count(word_count); words.display_word_count(final_file)"

```
### Output
Output will look something like this:  
```
called => 1
calls => 2 (prime)
children => 3 (prime)
christening => 1
clothes => 1
couldn't => 1
```
