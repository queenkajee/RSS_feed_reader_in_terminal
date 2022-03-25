require 'rss'
require 'open-uri'


def rssUrlGet
  puts "Enter URL : "
  urlRss = gets.chomp
end
def consummingRss (url)
  tittle = ""
  description = ""
  URI.open(url) do |rss|
    feed = RSS::Parser.parse(rss)
    tittlle = feed.channel.title
    feed.items.each do |item|
      description = description + item.title
      description += " , "
    end
  end
  return tittle,description,url
end
