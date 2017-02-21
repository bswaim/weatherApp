require "barometer"
require "nokogiri"
require 'open-uri'

puts "Enter your location"
location = gets

def get_locations_weather(location)
  Barometer.new(location).measure
end
 
weather = get_locations_weather(location)
tomorrow = Time.now.strftime('%d').to_i + 1
 
weather.forecast.each do |forecast|
  day = forecast.starts_at.day
  
  if day == tomorrow
    dayName = 'Tomorrow'
  else
    dayName = forecast.starts_at.strftime('%A')
end

  if forecast.icon == "clear"
  clothing = 'light and cool clothing'
  elsif forecast.icon.include? "cloudy"
  clothing = 'a light sweater'
  elsif forecast.icon == "chancetstorms"
  clothing = 'a rain coat, and stay indoors'
  elsif forecast.icon == "chancerain"
  clothing = 'a rain coat'
  elsif forecast.icon == "chancesnow"
  clothing = 'a heavy coat'
  else
  clothing = 'appropriate clothing'
end
   
  puts dayName + ' is going to be ' + forecast.icon + ' with a low of ' + forecast.low.f.to_s + ' and a high of ' + forecast.high.f.to_s + '. Be sure to wear '+ clothing+'.'
end
