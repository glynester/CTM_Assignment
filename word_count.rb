class Words

  def initialize(file_inp="")
    show_info
    @file_inp = file_inp
    @file_inp = prompt_user if file_inp == ""
    raise ("There is no file called '#{@file_inp}' at this location.") if !file_exists? #|| @file_inp == ""
  end

  def show_info
    puts "Paste a .txt file into the same folder as this application."
    puts "NOTE: You can run this program by calling 'x=Words.new' or 'x=Words.new(\"file_name.txt\")'."; puts
  end

  def open_file
    text = ""
    begin
      File.open("./#{@file_inp}").each do |line| text << line end
    rescue Errno::EISDIR
      raise ("There is no file called '' at this location.")
    end
    text
  end

  def count_words(text)
    text = text.scan(/\b[aio]\b|[\w]+['-]?[\w]+/i)     # Assume only a,i,o allowed as single letters.
    word_hash = Hash.new(0)
    text.each{|w| word_hash[w.downcase]+=1 }
    word_hash
  end

  def prepare_word_count(word_count)
    word_count_prime=[]
    word_count=word_count.sort.to_h
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
    require 'prime'
    Prime.instance.prime?(num)
  end

  private

  def prompt_user
    print "Enter the name of the file: "
    @file_inp = gets.chomp
  end

  def file_exists?
    File.exists?("./#{@file_inp}")
  end


end
