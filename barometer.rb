require "nokogiri"
require "open-uri"
require "barometer"

barometer = Barometer.new('Chicago')
weather = barometer.measure
puts weather.current.temperature