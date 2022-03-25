require 'rss'
require 'open-uri'

url = ''

puts "Enter URL"
url = gets.chomp


URI.open(url) do |rss|
  feed = RSS::Parser.parse(rss)
  puts "Title: #{feed.channel.title}"
  feed.items.each do |item|
    puts "Item: #{item.title}"
  end
end
puts url
