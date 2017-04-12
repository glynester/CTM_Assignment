class Words

  def initialize(text="")
    @text = text
  end

  def count_words
    @text = @text.scan(/\b[aio]\b|[\w]+['-]?[\w]+/i)     # Assume only a,i,o allowed as single letters.
    word_hash = Hash.new(0)
    @text.each{|w| word_hash[w.downcase]+=1 }
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



end
