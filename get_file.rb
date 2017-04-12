class File

  def initialize(file_inp="")
    @file_inp = file_inp
    @file_inp = prompt_user if file_inp == ""
    raise ("There is no file called '#{@file_inp}' at this location.") if !file_exists? #|| @file_inp == ""
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

  def file_exists?
    File.exists?("./#{@file_inp}")
  end

end
