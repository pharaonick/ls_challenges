=begin
"99 bottles of beer on the wall, 99 bottles of beer.\n"
"Take one down and pass it around, 98 bottles of beer on the wall.\n"

"2 bottles of beer on the wall, 2 bottles of beer.\n"
"Take one down and pass it around, 1 bottle of beer on the wall.\n"

"1 bottle of beer on the wall, 1 bottle of beer.\n"
"Take it down and pass it around, no more bottles of beer on the wall.\n"

"No more bottles of beer on the wall, no more bottles of beer.\n"
"Go to the store and buy some more, 99 bottles of beer on the wall.\n"

=end

# class BeerSong
#   def verse(bottles)
#     case bottles
#     when 2 then two_bottles
#     when 1 then one_bottle
#     when 0 then no_bottles
#     else "#{bottles} bottles of beer on the wall, #{bottles} bottles of beer.\nTake one down and pass it around, #{bottles - 1} bottles of beer on the wall.\n"
#     end
#   end

#   def verses(start_verse, end_verse)
#     output = []
#     start_verse.downto(end_verse) { |v| output << verse(v) }
#     output.join("\n")
#   end

#   def lyrics
#     verses(99, 0)
#   end

#   # def adjust_label

#   # end

#   def two_bottles
#     "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n"
#   end

#   def one_bottle
#     "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
#   end

#   def no_bottles
#     "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
#   end
# end


# class BeerSong
#   def verse(number)
#     "#{bottles(number).capitalize} of beer on the wall, " \
#     "#{bottles(number)} of beer.\n" \
#     "#{second_line(number)}"
#   end

#   def verses(start_verse, end_verse)
#     start_verse.downto(end_verse).map { |v| verse(v) }.join("\n")
#   end

#   def lyrics
#     verses(99, 0)
#   end

#   private

#   def second_line(number)
#     case number
#     when 1
#       "Take it down and pass it around, " \
#       "#{bottles(number - 1)} of beer on the wall.\n"
#     when 0
#       "Go to the store and buy some more, " \
#       "99 bottles of beer on the wall.\n"
#     else
#       "Take one down and pass it around, " \
#       "#{bottles(number - 1)} of beer on the wall.\n"
#     end
#   end

#   def bottles(number)
#     case number
#     when 1 then "1 bottle"
#     when 0 then "no more bottles"
#     else "#{number} bottles"
#     end
#   end
# end

######################
# BONUS: no conditionals -- if or case -- in code


# works but weird org is weird needs refac
# module BottleNumbers
#   class Verse
#     attr_reader :lines

#     def initialize(number)
#       @number = number

#       @SELECT_VERSEeral = "#{@number} bottles of beer on the wall, #{@number} bottles of beer.\n" +
#                        "Take one down and pass it around, #{@number - 1} bottles of beer on the wall.\n"

#       @verse_two     = "2 bottles of beer on the wall, 2 bottles of beer.\n" +
#                        "Take one down and pass it around, 1 bottle of beer on the wall.\n"

#       @verse_one     = "1 bottle of beer on the wall, 1 bottle of beer.\n" +
#                        "Take it down and pass it around, no more bottles of beer on the wall.\n"

#       @verse_zero    = "No more bottles of beer on the wall, no more bottles of beer.\n" +
#                        "Go to the store and buy some more, 99 bottles of beer on the wall.\n"

#       @SELECT_VERSEerator = {
#         2 => @verse_two,
#         1 => @verse_one,
#         0 => @verse_zero
#       }
#       @SELECT_VERSEerator.default = @SELECT_VERSEeral
      
#       @lines = @SELECT_VERSEerator[@number]
#     end
#   end
# end

# class BeerSong
#   include BottleNumbers

#   def verse(number)
#     Verse.new(number).lines
#   end

#   def verses(start_verse, end_verse)
#     start_verse.downto(end_verse).map { |v| verse(v) }.join("\n")
#   end

#   def lyrics
#     verses(99, 0)
#   end
# end

#################

# module BeerSongVerses
#   class Verse
#     attr_reader :lines

#     def initialize(number)
#       @lines = "#{number} bottles of beer on the wall, #{number} bottles of beer.\n" +
#                "Take one down and pass it around, #{number - 1} bottles of beer on the wall.\n"
#     end
#   end

#   class VerseTwo < Verse
#     def initialize(_)
#       @lines = "2 bottles of beer on the wall, 2 bottles of beer.\n" +
#                "Take one down and pass it around, 1 bottle of beer on the wall.\n"
#     end
#   end

#   class VerseOne < Verse
#     def initialize(_)
#       @lines = "1 bottle of beer on the wall, 1 bottle of beer.\n" +
#                "Take it down and pass it around, no more bottles of beer on the wall.\n"
#     end
#   end

#   class VerseZero < Verse
#     def initialize(_)
#       @lines = "No more bottles of beer on the wall, no more bottles of beer.\n" +
#                "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
#     end
#   end

#   SELECT_VERSE = {
#     2 => VerseTwo,
#     1 => VerseOne,
#     0 => VerseZero
#   }
#   SELECT_VERSE.default = Verse
  
#   def verse_lyrics(number)
#     SELECT_VERSE[number].new(number)
#   end
# end

# class BeerSong
#   include BeerSongVerses

#   def verse(number)
#     verse_lyrics(number).lines
#   end

#   def verses(first, last)
#     first.downto(last).map { |v| verse(v) }.join("\n")
#   end

#   def lyrics
#     verses(99, 0)
#   end
# end

#################

module BeerSongVerses
  class Verse
    attr_reader :lines

    def initialize(number)
      @lines = "#{number} bottles of beer on the wall, #{number} bottles of beer.\n" +
               "Take one down and pass it around, #{number - 1} bottles of beer on the wall.\n"
    end
  end

  class VerseTwo < Verse
    def initialize(_)
      @lines = "2 bottles of beer on the wall, 2 bottles of beer.\n" +
               "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    end
  end

  class VerseOne < Verse
    def initialize(_)
      @lines = "1 bottle of beer on the wall, 1 bottle of beer.\n" +
               "Take it down and pass it around, no more bottles of beer on the wall.\n"
    end
  end

  class VerseZero < Verse
    def initialize(_)
      @lines = "No more bottles of beer on the wall, no more bottles of beer.\n" +
               "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end
end

class BeerSong
  include BeerSongVerses

  SELECT_VERSE = { 2 => VerseTwo, 1 => VerseOne, 0 => VerseZero }
  SELECT_VERSE.default = Verse

  def verse(number)
    correct_verse = SELECT_VERSE[number].new(number)
    correct_verse.lines
  end

  def verses(first, last)
    first.downto(last).map { |v| verse(v) }.join("\n")
  end

  def lyrics
    verses(99, 0)
  end
end

# more complex than it needs to be? Hide inconsistency behind different methods
# rather than objects?

# puts BeerSong.new.verse(10)
# puts BeerSong.new.verse(3)
# puts BeerSong.new.verse(2)
# puts BeerSong.new.verse(1)
# puts BeerSong.new.verse(0)
puts BeerSong.new.verses(4, 0)
# puts BeerSong.new.verses(99, 96)
# puts BeerSong.new.lyrics


