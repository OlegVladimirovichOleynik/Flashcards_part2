require 'open-uri'
require 'nokogiri'

url = 'http://sanstv.ru/english_words'
html = open(url)

doc = Nokogiri::HTML(html)

doc.css("tr").each do |tr|
  original_text = tr.css("td:nth-child(4)").text
  translated_text = tr.css("td:nth-child(6)").text.encode("ISO-8859-1")
  Card.create(original_text: original_text, translated_text: translated_text)
end
