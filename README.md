<!-- solution page: https://github.com/Ada-C13/recursion-tracing/tree/solutions -->

# Recursion Problems

## Definitions
Define the following: 
- Recursion: A method which calls itself.  

- Recursive Case: The part of a recursive method which makes a recursive call (When the function calls itself)

- Base Case: A condition to stop recursion. The base case is when the function doesn’t call itself again ... so it doesn’t go into an infinite loop.

- Activation Chain/Function Call Stack: It is the same as `call stack`. This is a 'stack data structure' which stores currently running method calls. 

- Activation Record/Function Call:  Function calls are placed on the system call stack which functions in a last-in-first-out order. The separate pieces of the Activation Chain. Every function call results in a record getting created in the stack memory.??

- Infinite Recursion/Stack Overflow/Stack too deep: It is an error which occurs when the call stack runs out of memory. For example, in a recursice method, if there is no base case, `inifinite recursion/stack overflow` will happen.

- Tail Recursion: When the recursive call finishes, there are no more calculations left to perform. (i.e. Having calcuations inside of the parameters ??)


## Tracing through a recursive method. Time & Space complexity.
### Trace #1 (Calculating sum)
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
- What is mystery1(0)? stack overflow error
- What is the time complexity of mystery1(n)? O(n) <br>
=> Since I used the number of `recursive calls`, time complexity is O(n)

- What is the space complexity of mystery1(n)? O(n) <br>
=> Because we are using hidden data structure, the System Stack. Since the stack grows with each recursion, space complexity is O(n)

### Trace #2 (Adding each digit - i.e. 123 => 6)
```ruby
def mystery2(n)
  if n < 10
    return n
  else
    return (n%10) + mystery2(n/10)
  end
end
```

- What is mystery2(123)? => 6 </br>
m2(123) = 3 + m2(12) = 6 </br>
m2(12) = 2 + m2(1) = 3 </br>
m2(1) = 1 


- What is mystery2(9005)? => 14 </br>
m2(9005) = 5 + m2(900) = 14 </br>
m2(900) = 0 + m2(90) = 9 </br>
m2(90) = 0 + m2(9) = 9 </br>
m2(9) = 9 </br>


- What is mystery2(-123)? => -123

- What is the time complexity of mystery2(n)? => log 10 n <br>
=>log (base 10) of n </br>
=> Since a number was divided by 10 in a resursive call, time compleixty is "log 10 n"

- What is the space complexity of mystery2(n)? => log 10 n


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

### Trace #3 (return 100 for positive numbers and return 200 for negative numbers)
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

- What is mystery3(1)? => 100 <br>
m3(1) = m3(0) = 100 <br>
m3(0) = 100 <br>

- What is mystery3(13)? => 100 <br>
m3(13) = m3(12) = 100 <br>
m3(12) = m3(6) = 100 <br>
m3(6) = m3(3) = 100 <br>
m3(3) = m3(2) = 100 <br>
m3(2) = m3(1) = 100 <br>
m3(1) = m3(0) = 100 <br>
m3(0) = 100 <br>

- What is mystery3(-6)? 200 <br>
m3(-6) = m3(-3) = 200 <br>
m3(-3) = m3(-4) = 200 <br>
m3(-4) = m3(-2) = 200 <br>
m3(-2) = m3(-1) = 200 <br>
m3(-1) = 200 <br>


- What is the time complexity of mystery3(n)? O(log n)

- What is the space complexity of mystery3(n)? O(log n)


### Trace #4 (b to the power of e) => i.e. 3^4 = 3 * 3^3 
```ruby
def mystery4(b, e)
  if e == 0
    return 1
  else
    return b * mystery4(b, e-1)
  end
end
```

- What is mystery4(10, 2)? => 100 <br>
m4(10, 2) = 10 * m4(10, 1) = 100 <br>
m4(10, 1) = 10 * m4(10, 0) = 10 <br>
m4(10, 0) = 1 <br>


- What is mystery4(4, 3)? => 64 <br>
m4(4, 3) = 4 * m4(4, 2) = 64 <br>
m4(4, 2) = 4 * m4(4, 1) = 16 <br>
m4(4, 1) = 4 * m4(4, 0) = 4 <br>
m4(4, 0) = 1 <br>


- What is mystery4(5, 0)? 1

- What is the time complexity of mystery4(b, e)? O(n) <br> 
=> Where n is the size of e 

- What is the space complexity of mystery4(b, e)? O(n)


### Trace #5 (replace one character by *)
```ruby
def mystery5(s)
  if s.length == 0
    return ""
  else
    return "*" + mystery5(s[1..-1])
  end
end
```

- What is mystery5("hi")? => "**" <br>
m5("hi") = * + m5("i") = ** <br>
m5("i") = * + m5("") = * <br>
m5("") = "" <br>


- What is mystery5("")? =>  ""

- What is mystery5("Hi, there!")? => "**********" <br>
m5("Hi, there!") = * + m5("i, there!") = ********** <br>
m5("i, there!") = * + m5(", there!") = ********* <br>
m5(", there!") = * + m5(" there!") = ******** <br>
m5(" there!") = * + m5("there!") = ******* <br>
m5("there!") = * + m5("here!") = ****** <br>
m5("here!") = * + m5("ere!") = ***** <br>
m5("ere!") = * + m5("re!") = **** <br>
m5("re!") = * + m5("e!") = *** <br>
m5("e!") = * + m5("!") = ** <br>
m5("!") = * + m5("") = * <br>
m5("") = "" <br>


- What is the time complexity of mystery5(s)? O(n) 
<br>
=> where n is the length of s

- What is the space complexity of mystery5(s)? O(n^2) <br>
=> Because of s[1..-1] and the System Stack <br>
=> Although we created a string, not an array, it will take O(n) space <br>


- _Added Fun: How could we make only alphabetic characters to be changed to stars?_
```Added Fun
def mystery5(s)
  if s.length == 0
    return ""
  else
    if s[0].match(/[a-zA-Z]/)   
      return "*" + mystery5(s[1..-1])
    else 
      return s[0] + mystery5(s[1..-1])  # important!
    end 
  end
end
```


### Trace #6 (Reversing sentence by word)
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

- What is mystery6("goodnight moon")? => "moon goodnight"<br>
m6("goodnight moon") = m6("moon") + " " + "goodnight" = " moon goodnight" <br>
m6("moon") = m6("") + " " + "moon" = " moon" <br>
m6("") = ("") <br>


- What is mystery6("Ada Developers Academy")? => "Academy Developers Ada" <br>
m6("Ada Developers Academy") = m6("Developers Academy") + " " + "Ada" = " Academy Developers Ada" <br>
m6("Developers Academy") = m6("Academy") + " " + "Developers" = " Developers Academy" <br>
m6("Academy") = m6("") + " " + "Academy" = " Academy"
m6("") = "" <br>


- What is mystery6("Hi, there!")? => there! Hi,"

- What is the time complexity of mystery6(s)? O(n) <br>
=> O(n) where n is the length of s <br>
=> 2n became n (Recursive calls O(n) + until loop O(n))<br> 
=> It could be <b>O(n + m)</b> <br>
=> Because of the following reasons: <br>
** n: the length of s   <br>
** m: the number of recursive calls (the number of words)  <br>


- What is the space complexity of mystery6(s)? => O(n * m) <br>
=> Because M is recursives calls + Each time we make a string, N letters long.

- _Added Fun: How could we make the reversal happen by letter, instead of by word (i.e. Make it so that mystery6("goodnight moon") returned "noom thgindoog")?_

```Added Fun (reverse by char)
def mystery6(s)
  if s == nil || s.length == 0
    return ""    # or return s
  else
    return mystery6(s[1..-1]) + s[0]
  end
end
```

### Trace #7 (checking palindrome)
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

- What is the time complexity of mystery7(word)? O(n) <br>
 => where n is the length of word. 

- What is the space complexity of mystery7(word)? O(n^2) <br>
=> Every time, we create a new word + the system stack