require 'rss'
require 'open-uri'

class Consumming_RSS
  attr_accessor :title, :description, :url, :urlList
  def initialize(url)
    @url = url
    @description = ""
    @urlList = ""
  end
  def getRSSData
    URI.open(@url) do |rss|
      feed = RSS::Parser.parse(rss)
      @title = feed.channel.title
      feed.items.each do |item|
        @description = @description + item.title
        @description = @description + " ,\n "
      end
      @urlList = feed.attr_reader :href
#      feed.link.each do |thing|
#        @urlList = @urlList + thing.title
#        @urlList = @urlList + " แบ่งขั้นกันเถอะเรา  \n\n\n\n\n\n\n"
#      end
    end
  end
  def getTittle
    puts @title
  end
  def getDescription
      puts @description
  end
  def getURL
    puts @urlList
  end
end

def rssUrlGet
  puts "Enter RSS feed URL : "
  rssFeedUrl = gets.chomp
  url1 = Consumming_RSS.new(rssFeedUrl)
  url1.getRSSData
#  url1.getTittle
#  url1.getDescription
  url1.getURL
end

rssUrlGet()
