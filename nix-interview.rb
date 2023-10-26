#INITIAL PROMPT
# When placing orders, customers are allowed to add special instructions to their orders, for instance specifying that they don't need utensils or that they want their steak cooked a certain way.
# Restaurant receipt printers have restrictions for how many characters can fit on each line. This means that in many cases special instructions must be wrapped and put on multiple lines in order for the text to fit.
# Write a function 'WordWrap' that takes as input a string (the special instructions) and an integer (the character limit) and returns the special instructions wrapped onto lines with no line exceeding the character limit.

#INITIAL BRAINSTORMING
#write a function WordWrap that takes an input of a string (special instructions) and an integer (the character limit)
#returns the special instructions wrapped onto the lines with no line exceeding the character limit
#return value should be an array of strings

# does scan break strings on character limit exclusively, or words?

#BONUS DELIVERABLES AND COMMENTS
# we don't want words to split onto separate lines
    #can we have a limit of 10 characters, but if a word spills over so that the string would be greater than 10 characters, can we break before that word and return the string?
    #if the word is longer than the character limit, hyphenate the word
         #the last character is instead a hyphen
         #next line starts with the next character
         #only applied if the string is a single word that is longer than the character limit
# the end appears to be cut off
   # the last string would be less than 10 characters so how do we return a string less than the integer?

#INITIAL DELIVERABLES

# special_instructions = "I live on the fifth floor, so please use the elevator."

# def wordwrap(string, integer)
#     arr = string.scan(/.{1,#{integer}}|.{1,#{string.length % integer}}/)
#     p arr
# end

# wordwrap(special_instructions, 10)

#if a line were to consist of a single word that is longer than integer
    #index of integer - 1 should be a hyphen
    #next line starts with the next character and continues
    #if the rest of the word is still longer than integer, hyphen again
    #elsif word length is greater than integer

# special_instructions = "I would like you to write the word supercalifragilisticexpialidocious on my pizza box"

# def wordwrap(string, integer)
#     lines = []
#     line = ""
  
#     string.split.each do |word|
#       if (line + word).length <= integer
#         line += (line.empty? ? "" : " ") + word
#       else
#         lines << line
#         line = word
#       end
#     end
  
#     lines << line if line.length > 0
  
#     p lines
#   end

#   wordwrap(special_instructions, 10)

##FINAL, ACCEPTED DELIVERABLE##

special_instructions = "I would like you to write the word supercalifragilisticexpialidocious on my pizza box"

def wordwrap(string, integer)
    lines = []
    line = ""
  
    string.split.each do |word|
      if word.length > integer
        # Handle long words
        lines << line if line.length > 0
        while word.length > integer
          lines << word[0, integer - 1] + "-"
          word = word[integer..-1]
        end
        line = word
      else
        if (line + word).length <= integer
          line += (line.empty? ? "" : " ") + word
        else
          lines << line
          line = word
        end
      end
    end
  
    lines << line if line.length > 0
  
    p lines
  end

  wordwrap(special_instructions, 10)
