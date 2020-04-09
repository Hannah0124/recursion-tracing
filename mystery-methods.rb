# Trace #1
# time complexity: O(n)
# space complexity: O(n)
def mystery1(n)
  puts n
  if n == 1
    return n
  else
    return n + mystery1(n-1)
  end
end


# Trace #2 (adding each digit)
# time complexity: O(log 10 n)  => log (base 10) of n
# space complexity: O(log 10 n)
def mystery2(n)
  if n < 10
    return n
  else
    return (n%10) + mystery2(n/10)
  end
end


# Trace #3 (return 100 for positive numbers and return 200 for negative numbers)
# time complexity: O(log n)
# space complexity: O(log n)
def mystery3(n)
  if n == 0
    return 100
  elsif n == -1
    return 200
  end

  if n%2 == 0
    return mystery3(n/2)
  else
    return mystery3(n-1)
  end
end


# Trace #4 (b to the power of e)
# time complexity: O(e)
# space complexity: O(e)
# 
# i.e. 3^4 = 3 * 3^3 
def mystery4(b,e)
  if e == 0
    return 1
  else
    return b * mystery4(b,e-1)
  end
end


# Trace #5 (replace one character by *)
# time complexity: O(n) => where n is the length of s
# space complexity: O(n^2) => (becuz of s[1..-1] although we create a string, not an array) => According to Chris
def mystery5(s)
  if s.length == 0
    return ""
  else
    return "*" + mystery5(s[1..-1])
  end
end


# Trace #6 (Reversing sentence by word)
# n: the length of s 
# m: the number of recursive calls

# time complexity: O(n)  (2n became n) => where n is the length of s
# (according to Chris, it could be O(n) or O(n + m))
# space complexity: O(m * n)
# => Because M is recursives calls + Each time we make a string, N letters long.
def mystery6(s)  # n => the length of s
  if s == nil || s.length == 0
    return ""
  else
    space = 0
    until space >= s.length || s[space] == " "
      space += 1
    end
    return mystery6(s[(space+1)..-1]) + " " + s[0...space] # m => recursive calls (by word)
  end
end



# Trace #7 (checking palindrome)
# time complexity: O(n) => where n is the length of word. 
# space complexity: O(n^2) 
# => Every time, we create a new word + the system stack
def mystery7(word)
  if word.length < 2
    return true
  elsif word[0] != word[-1]
    return false
  else
    return mystery7(word[1..-2])
  end
end
