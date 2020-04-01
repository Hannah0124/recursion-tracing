<!-- solution page: https://github.com/Ada-C13/recursion-tracing/tree/solutions -->

# Recursion Problems

## Definitions
Define the following: 
- Recursion: A method which calls itself.  
- Recursive Case: The recursive case is (1)when the function calls itself. + (2) at least one base case 
- Base Case: A condition to stop recursion. The base case is when the function doesn’t call itself again ... so it doesn’t go into an infinite loop.
- Activation Record/Function Call: ?? (TODO) It is the same as `call stack`. This is a 'stack data structure' which stores currently running method calls.
- Infinite Recursion/Stack Overflow: It is an error which occurs when the call stack runs out of memeory. For example, in a recursice method, if there is no base case, `inifinite recursion/stack overflow` will happen.
- Tail Recursion: ?? (TODO)

## Tracing through a recursive method. Time & Space complexity.
### Trace #1
```ruby
def mystery1(n)
  if n == 1
    return n
  else
    return n + mystery1(n-1)
  end
end
```

- What is mystery1(5)? 15
- What is mystery1(10)? 55
- What is mystery1(0)? error
- What is the time complexity of mystery1(n)? O(n) => Since I used the number of `recursive calls`, time complexity is O(n)
- What is the space complexity of mystery1(n)? O(n) => Because we are using hidden data structure, the System Stack. Since the stack grows with each iteration, space complexity is O(n)

### Trace #2
```ruby
def mystery2(n)
  if n < 10
    return n
  else
    return (n%10) + mystery2(n/10)
  end
end
```

- What is mystery2(123)? 6
- What is mystery2(9005)? 14
- What is mystery2(-123)? -123
- What is the time complexity of mystery2(n)? O(n) => Since I used the number of recursive calls, time compleixty is O(n)
- What is the space complexity of mystery2(n)? O(n) => Since we are using hidden data structure, the System Stack. As the stack grows with each iteration, space complexity is O(n)
- _Added Fun: How could we make `mystery2(-123)` work the way we might expect it to work instead of the way it does?_ 
```Added fun
def mystery2(n)
  if n < 0 
    return -1 * mystery2(-n)
  elsif n < 10
    return n
  else
    return (n%10) + mystery2(n/10)
  end
end

p mystery2(-123) # => -6
```

### Trace #3
```ruby
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
```

- What is mystery3(1)? 100
- What is mystery3(13)? 100
- What is mystery3(-6)? 200
- What is the time complexity of mystery3(n)? Since I used number of recursive calls, the time complexity is O(n)
- What is the space complexity of mystery3(n)? Since I used the hidden data structure, the System Stack, as the stack grows with each iteration, the space complexity is O(n)



### Trace #4
```ruby
def mystery4(b, e)
  if e == 0
    return 1
  else
    return b * mystery4(b, e-1)
  end
end
```

- What is mystery4(10, 2)? 100
- What is mystery4(4, 3)? 64
- What is mystery4(5, 0)? 1
- What is the time complexity of mystery4(b, e)? Since I used the number of recursive calls, the time complexity is O(e) ?
- What is the space complexity of mystery4(b, e)? Since I used the hidden data structure, the System Stack, as the stack grows with each iteration, the space complexity is O(n)



### Trace #5
```ruby
def mystery5(s)
  if s.length == 0
    return ""
  else
    return "*" + mystery5(s[1..-1])
  end
end
```

- What is mystery5("hi")? "**"
- What is mystery5("")? ""
- What is mystery5("Hi, there!")? "**********"
- What is the time complexity of mystery5(s)? O(s) Since I used the number of recursive calls, the time complexity is O(s)
- What is the space complexity of mystery5(s)? O(s) Since I used the hidden data structure, the System Stack, as the stack grows with each iteration, the space complexity is O(n)
- _Added Fun: How could we make only alphabetic characters to be changed to stars?_
```Added Fun
def mystery5(s)
  if s.length == 0
    return ""
  else
    if s[0].match(/[a-zA-Z]/)    # /[a-zA-Z]/.match("***")
      return "*" + mystery5(s[1..-1])
    else 
      return s[0] + mystery5(s[1..-1])
    end 
  end
end
```


### Trace #6 (Reversing sentence => good quesiton!!)
```ruby
def mystery6(s)
  if s == nil || s.length == 0
    return ""
  else
    space = 0
    until space >= s.length || s[space] == " "
      space += 1
    end
    return mystery6(s[(space+1)..-1]) + " " + s[0...space]
  end
end
```

- What is mystery6("goodnight moon")? "moon goodnight"
- What is mystery6("Ada Developers Academy")? "Ada Developers Academy"
- What is mystery6("Hi, there!")? "Hi, there"
- What is the time complexity of mystery6(s)? Since I used the number of recursive calls (O(n)), + until loop (O(n)), it is O(n)
- What is the space complexity of mystery6(s)? Since we are using hidden data structure, the System Stack, as the stack grows with each iteration, the space compleixty is O(n)
- _Added Fun: How could we make the reversal happen by letter, instead of by word (i.e. Make it so that mystery6("goodnight moon") returned "noom thgindoog")?_

```Added Fun
def mystery6(s)
  if s == nil || s.length == 0
    return ""    # or return s
  else
    return mystery6(s[1..-1]) + s[0]
  end
end
```

### Trace #7 (palindrome => good quesiton!!)
```ruby
def mystery7(word)
  if word.length < 2
    return true
  elsif word[0] != word[-1]
    return false
  else
    return mystery7(word[1..-2])
  end
end
```

- What is mystery7("cupcake")? false
- What is mystery7("detected")? false
- What is mystery7("eye")? true
- What is the time complexity of mystery7(word)? Since I used the number of recursive calls, the time complexity is O(n)
- What is the space complexity of mystery7(word)? Since we are using hidden data structure, the System Stack, as the stack grows with each iteration, the space complexity is O(n)
