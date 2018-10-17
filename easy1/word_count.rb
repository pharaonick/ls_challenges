=begin
count occurence of each word in phrase

input: string
output: hash { word: count }

rules:
- ignore punctuation 
  - except apostrophes
  - if quote then need to ignore beginning and end apostrophe
- split on comma (or other punc) or newline
- case-insensitive
- numbers count as words

- split phrase into array according to ^ rules
  - whitespace
  - punctuation except apostrophe

- walk through creating hash entry at 1 if doesn't exist or incrementing if does


"one,\ntwo,\nthree"
  - split on non-word char then delete ''
"First: don't laugh. Then: don't cry."
"Joe can't tell between 'large' and large."

=end

# class Phrase
#   def initialize(phrase)
#     @phrase = phrase.downcase
#   end

#   def word_count
#     count = {}
#     words = @phrase.split(/\W/)
#     words.delete('')

#     words.each do |word|
#       count.key?(word) ? count[word] += 1 : count[word] = 1
#     end
    
#     count
#   end
# end

class Phrase
  def initialize(phrase)
    @phrase = phrase.downcase
  end

  # refactor...
  def word_count
    totals = {}
    words = custom_split(@phrase)

    # words.each do |word|
    #   totals.key?(word) ? totals[word] += 1 : totals[word] = 1
    # end

    words.each do |word|
      next if totals.key?(word)
      totals[word] = words.count(word)
    end
    
    totals
  end

  private

  def custom_split(str)
    split_string = str.split(/[^a-z0-9']/).map do |word|
      apostrophe?(word) ? word : word.delete("'")
    end
    
    split_string.delete('')
    split_string
  end

  def apostrophe?(word)
    word.count("'") == 1 && word[-2] == "'"
  end
end

# SO MANY WAYS TO REGEXP THIS... REMEMBER MODIFIERS LIKE + AND ?
# ALSO BETTER TO SCAN THAN SPLIT...
# PLUS REMEMBER YOUR HASH CONSTRUCTORS...
