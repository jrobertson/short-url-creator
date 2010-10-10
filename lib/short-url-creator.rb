#!/usr/bin/ruby

# file: short-url-creator.rb

class ShortUrlCreator
  def initialize()
    @chars = ('a'..'z').to_a + ('1'..'9').to_a + ('A'..'Z').to_a
    @array_size = @chars.size
    @h = Hash.new
    @chars.each {|c| @h[c] = '0'}
    vowels = %w(a e i o u A E I O U 4 3 1 0)
    vowels.each {|v| @h[v] = '1'}
    nums = %w(2 5 6 7 8 9)
    nums.each {|n| @h[n] = '2'}
    @count = 0
    @a = Array.new(7, -1)
    @k = 0
    @short_url = []
  end 

  def iterate_chars(array_size)
    (0..array_size).each {|i| 
      increment_index(@k)
      convert_to_chars()
    }
  end
  
  def convert_to_chars()
    buffer = ''
    @a.each {|i|
      buffer << @chars[i] if i >= 0
    }
    a = buffer.reverse.scan(/./)
    k = a.length  
    if  (k > 1)  
      if ((@h[a[k-2]] + @h[a[k-1]]) != '10')
        @short_url << buffer.reverse 
      end
    else
      @short_url << buffer.reverse
    end
  end

  def generate(count)
    get_short_url(count)
    @short_url
  end
  def get_short_url(count)
    if count >  @array_size
      new_count = count - @array_size
      iterate_chars(@array_size)
      get_short_url(new_count)
    else
      iterate_chars(count)
    end
  end
  
  def increment_a(i)
    if @a[i] < @array_size - 1
      @a[i] = @a[i] + 1
      return i 
    else
      @a[i] = 0
      return i += 1
    end 
  end

  def increment_index(k)
    old_k = k
    k = increment_a(k)
    
    if k != old_k
      increment_index(k)
    else
      k = 0
    end
    k
  end

end
