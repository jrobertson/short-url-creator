# Introducing the Short URL Creator gem

    require 'short-url-creator'

    surl = ShortUrlCreator.new

    # generate 10,061 unique ids
    surl.generate(10061) do |a|
      a.slice!(0,61)      # slices out the single characters
      a.length #=> 8611   # remaining ids after sanitisation  
    end
    surl.save
