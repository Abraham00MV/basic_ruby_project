
def word_finder(sentence,dictionary)
sentence = sentence.split(/ |, /)

 result_matches = sentence.reduce(Hash.new(0)) do |match_words, word|
if dictionary.any?(word)
 match_words[word] += 1
	end
	match_words
 end

 result_matches.empty? ? 'Not Found Matches' : result_matches
end