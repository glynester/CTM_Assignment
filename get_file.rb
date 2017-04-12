class Inp_File

  attr_reader :text

  def initialize(file_inp="")
    @file_inp = file_inp
    @file_inp = prompt_user if file_inp == ""
    show_info
    raise ("There is no file called '#{@file_inp}' at this location.") if !file_exists?
  end

  def show_info
    puts "Paste a .txt file into the same folder as this application."
    # puts "NOTE: You can run this program by calling 'x=Words.new' or 'x=Words.new(\"file_name.txt\")'."; puts
  end

  def open_file
    @text = ""
    begin
      File.open("./#{@file_inp}").each do |line| @text << line end
    rescue Errno::EISDIR
      raise ("There is no file called '' at this location.")
    end
  end

  def file_exists?
    File.exists?("./#{@file_inp}")
  end

  private

  def prompt_user
    print "Enter the name of the file: "
    @file_inp = gets.chomp
  end

end
