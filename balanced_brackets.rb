# Challenge: Check if a given string of brackets is balanced
# Note: This method assumes input can be any of the following: [](){}
#
# string [String] input to check if balanced
# return [Boolean] true if balanced, false if not
def balanced?(string)
  return false unless string.size.even?

  hash = { '{' => '}', '[' => ']', '(' => ')' }
  stack = []

  string.chars do |char|
    if hash.keys.include?(char)
      stack << char
    else
      return false unless hash[stack.pop] === char
    end
  end

  stack.empty?
end

string = '{([])}'
p balanced?(string) # => true

string = '{[(})]'
p balanced?(string) # => false

# Explanation: In this example, we create a hash with all the possible opening brackets as hash keys 
# and all of their corresponding closing brackets as their values. Then we iterate through the characters
# of a given string. For each character, if the character exists in our hash keys, we know it's one of the
# opening brackets, and so we push it onto our stack. Otherwise, we pop the last value from our stack
# and check the if the current character is the corresponding bracket for the last item pushed to our stack.
# If it is not a match, we know the brackets are not balanced, so we return false. After iterating through
# all chars, if our stack is empty, then the brackets are balanced. Otherwise it is unbalanced.