#Subtstring method
require_relative 'word_finder'

puts "Write a sentence : "
sentence = gets.chomp

dictionary = ["ruby","welcome","enviroment","proof","go","down","developer",
	"stake","horn","how","howdy","it","i","low","own","part","partner","sit"]

#method for match a word with my dictionary :
puts word_finder(sentence, dictionary)