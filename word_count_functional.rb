def words(file_inp="")
  require 'prime'
  show_info
  prompt_user(file_inp) if file_inp == ""
  raise ("There is no file called '#{file_inp}' at this location.") if !file_exists?(file_inp)
  text = open_file(file_inp)
  word_count = count_words(text)
  final_file = prepare_word_count(word_count)
  display_word_count(final_file)
end

def show_info
  puts "Paste a .txt file into the same folder as this application."
  puts "NOTE: You can run this program by calling 'words' or 'words(\"file_name.txt\")'."; puts
end

def prompt_user(file_inp)
  puts "Enter the name of the file below:"
  file_inp = gets.chomp
end

def open_file(file_inp)
  text = ""
  File.open("./#{file_inp}").each do |line|
    text << line
  end
  text
end

def file_exists?(file_inp)
  File.exists?("./#{file_inp}")
end

def count_words(text)
  text = text.scan(/[\w]+['-]?[\w]+/)
  word_hash = Hash.new(0)
  text.each{|w| word_hash[w.downcase]+=1 }
  word_hash
end

def prepare_word_count(word_count)
  word_count_prime=[]
  word_count.each{|k,v|
    val = "#{k} => #{v}"
    val += " (prime)" if is_prime?(v)
    word_count_prime << val
  }
  word_count_prime
end

def display_word_count(info)
  info.each{|v| puts v}
end

def is_prime?(num)
  Prime.instance.prime?(num)
end

# words
words("test.txt")
