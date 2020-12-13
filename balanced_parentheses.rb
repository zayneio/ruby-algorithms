# Challenge: Check if a given string of parentheses is balanced
# Note: This method assumes we are only dealing with '(' and ')' chars.
#
# string [String] input to check if balanced
# return [Boolean] true if balanced, false if not
def balanced?(string)
  return false unless string.size.even?

  stack = []

  string.chars.each do |char|
    case char
    when "("
      stack.push(char)
    when ")"
      return false unless stack.pop === '('
    end
  end

  stack.empty?
end

string = '()'
p balanced?(string) # => true

string = '((()))'
p balanced?(string) # => true

string = '(()))(()))'
p balanced?(string) # => false

string = '(()'
p balanced?(string) # => false

# Explanation: In the above approach, we iterate through each character of the given string.
# For each character, if it is an opening parenthesis, we add it to our stack.
# If it is a closing parenthesis, we pop the last item added to our stack and  check to make sure
# that it is a corresponding opening parenthesis. If at any point during this check the last item
# in our stack is not a corresponding opening parenthesis, or the stack is empty and 
# the current char is closing, then we can conclude that the string is unbalanced.
# After iterating through the full string, our stack should be empty and our answer boolean should == true 
# if the string is balanced.