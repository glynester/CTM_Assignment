# WORD COUNT APPLICATION
This application outputs the individual words that appear in a given text file and how many times that word appears in the text file.  
The list is sorted alphabetically.  
If the number of times each word appears is a prime number, then this is indicated.  

## Program Structure  
There are 2 classes; "Words" and "Inp_File".  
"Inp_File" is used to prepare a file to be passed to "Words".  
"Words" processes the information and produces the required word analysis.  
"Words" can also receive plain text as an argument without using "Inp_File".

## Technologies
Written in ruby using rspec for testing.

## Running the program
Load the file that you wish to examine in the same directory as this application.  
Then choose one of the 3 methods below.  

## A) Running the program using the provided script files
There are 2 ways to run this application:  
1) File IS supplied in initialization of class.  
From the command line in the root directory, type:   
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

## B) Running the program directly from pry  
There are 2 ways to run this application:  
1) File IS supplied in initialization of class.  
From the command line, type: pry  
```
require './lib/word_count.rb'  
require "./lib/get_file.rb"  

Then enter each of the commands from testscript1.rb (either individually or all together).  
```

2) File is NOT supplied in initialization of class.  
From the command line, type pry
```
require './lib/word_count.rb'  
require "./lib/get_file.rb"  
f = Inp_File.new
```
Manually enter the name of the file.  
```
Then enter the REMAINING commands from testscript2.rb (either individually or all together).  
```

## C) Running the program directly from the command line  
There are 2 ways to run this application:  
1) File IS supplied in initialization of class.  
Run the following command:  
```
ruby -r './lib/get_file.rb' './lib/word_count.rb' -e "f = Inp_File.new("test.txt"); f.open_file; p f.text; w = Words.new(f.text); word_count = w.count_words; final_file = w.prepare_word_count(word_count); w.display_word_count(final_file);"  
```
2) File is NOT supplied in initialization of class.  
Run the following command:  
```
ruby -r './lib/get_file.rb' './lib/word_count.rb' -e "f = Inp_File.new; f.open_file; p f.text; w = Words.new(f.text); word_count = w.count_words; final_file = w.prepare_word_count(word_count); w.display_word_count(final_file);"   

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

### Testing the program  
Run the following command in the command line:  
```
rspec  
```
Press enter to complete the tests.  
