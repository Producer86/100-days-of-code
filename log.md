# 100 Days Of Code - Log
<h3>
Hello,
</h3>
And welcome to the logs of my 100 days of code challenge!

My name is TB, at the time of writing this I'm a freelance software developer and there's a language, R, which I use relatively often, but our relationship is not cloudless, so I'm starting this challenge to improve it.

Also, I want to work on my barely existent statistical skills, because I could see good use of them and anyways yay doing science. :D

The plan is to work my way through the
[R Manuals](https://cran.r-project.org/manuals.html)
first, the language definition and the internals, to get a bit better feel for what's going on under the hood.
Then I saw [Computer Age Statistical Inference](https://web.stanford.edu/~hastie/CASI/) and [Machine Learning for Hackers](http://shop.oreilly.com/product/0636920018483.do) recommended, which both seems a hell of a lot of fun indeed.

Now, given that I move along books which involves a lot of reading and also don't know how beefy is the math in them, so there's a chance there will be times when I don't actually write code but instead figure out the math or just, you know, read. But as long as I keep up with the logs it should be fine I think. We shall see!

Cheers,
TB

---
<a id="day1"></a>
<h2 align="center">
Day 1: Monday October 08, 2018
</h2>

**Today’s Progress**: Read the objects chapter in the R language definition.

**Thoughts:**

So for me, the most relevant part was about the object attributes, because not long ago I encountered a ~~bug~~ known limitation, where certain functions "striped" the class from the arguments. "Wait, what?" Yea, so what on earth could happen in a seemingly not-so-complicated function, like `base::ifelse` that unboxes an object and what it even means?<br>
As it turns out, in R, all objects, except NULL, has attributes, which is essentially a list of key-value pairs, containing information like the names in a named vector. Classes are implemented through this attributes mechanism.<br>
>`> x <- as.Date("2018-10-08")`<br>
>`> attributes(x)`<br>
>`$'class'`<br>
>`[1] "Date"`<br>

And striping a class simply means deleting the class attribute.<br>
>`> x`<br>
>`[1] "2018-10-08"`<br>
>`> attr(x, "class") <- NULL`<br>
>`> x`<br>
>`[1] 17812`<br>

Which can happen in numerous and various ways. To make it more confusing the manual says
>Subsetting (other than by an empty index) generally drops all attributes except names, dim and dimnames which are reset as appropriate.

and `base::c` description says
>All arguments are coerced to a common type which is the type of the returned value, and all attributes except names are removed.

yet
>`> x <- as.Date("2018-10-08")`<br>
>`> y <- as.Date("2018-10-09")`<br>
>`> v <- c(x, y)`<br>
>`> attributes(v)`<br>
>`$class`<br>
>`[1] "Date"`<br>
>`> attributes(v[1])`<br>
>`$'class'`<br>
>`[1] "Date"`<br>

I guess I will have to read further to figure this out, classes are discussed in chapter 5, looking forward to it.

By the way, I know C++'s OOP features are not the pristine embodiments of the principles, but still, I socialized on them, so whenever I see classes in other languages I can't help but see this

![alien-resurrection-room-1-8](https://user-images.githubusercontent.com/28347433/46635388-87c00580-cb54-11e8-9768-2d9d9e3933c6.jpg)

And for the longest time I learned about them with the appropriate attitude

![flame_thrower_resurrection](https://user-images.githubusercontent.com/28347433/46635766-c99d7b80-cb55-11e8-95ae-c09abac73cab.jpg)

But to be honest even C# has its own twist on them, but if I would have to choose between multiple inheritance or interfaces, it's not even close. In JavaScript I like to think about its features like primordial Class-pieces which evolved separately and even if they cannot be put together anymore, they have their places on their own right.

So overall I think what caused me a lot of trouble in the past is the fact that we have much more somewhat similar, but not compatible ideas than appropriate words to describe them.<br>
For example, in a project, I had a backend with a structure similar to MVC, but only "Models" and "Controllers". Since it used MongoDB I already had "Models" so renamed them to "Managers", but it runs in a cluster managed by Kubernetes, which has a "Controller-Manager"...you get the point :D<br>
/rambling<br>

**Link to tweet:** [Day 1](https://twitter.com/SzunTB/status/1049435242761789440)

---
<a id="day2"></a>
<h2 align="center">
Day 2: Tuesday October 09, 2018
</h2>

**Today’s Progress**: Finished chapter 3 in the R manual.

**Thoughts:**

It was about the evaluation of expressions. Went through on basic operators, control structures, with a bit more depth on operators NA handling and indexing, then finished with a good chunk about scoping.

The most important part was that the `if (...) ... else ...` statement actually has a return value, which is the statement evaluated based on the condition. So there it is, the missing ternary operator is the structure itself! :D

Speaking of which, still no further info about indexing and attributes, other than [[ drops names, while [ doesn't, which makes sense.

Got some solid "good to know" info overall, so sailing forward.

**Link to tweet:** [Day 2](https://twitter.com/SzunTB/status/1049789287598878720)

---
<a id="day3"></a>
<h2 align="center">
Day 3: Wednesday October 10, 2018
</h2>

**Today’s Progress**: Finished chapter 4 in the R manual about functions.

**Thoughts:**

This was a fairly short chapter and most concepts were familiar so I could move quickly.<br>
The only idea, which is quite new to me is storing function arguments in promises, but I think it's neat.<br>
That's it, short chapter, short update. :)

**Link to tweet:** [Day 3](https://twitter.com/SzunTB/status/1049989602772172800)

---
<a id="day4"></a>
<h2 align="center">
Day 4: Thursday October 11, 2018
</h2>

**Today’s Progress**: Finished chapter 5 in the R manual about OOP.

**Thoughts:**

It quickly turned out that the manual writes about the older mechanism, called S3, and there's a newer one, called S4.<br>
So this one, admittedly, is not too complicated. As the manual says, it's mainly a naming convention. I did [my naive take on it](https://github.com/Producer86/100-days-of-code/blob/master/works/day4/s3.R), which took unnecessarily long because I tried the good old person, worker inheritance and as it turned out there are already methods in the base package for a person class, so got some quite surprising error messages.
Overall I can see the use cases, a few one-liners can save a good amount of element extraction, that's nice, but even the manual encourages to keep things simple.<br>
Glanced a bit into the S4 method too, where there are some more serious contracts, it looks terribly cumbersome.

**Link to tweet:** [Day 4](https://twitter.com/SzunTB/status/1050550675082489856)

---
<a id="day5"></a>
<h2 align="center">
Day 5: Friday October 12, 2018
</h2>

**Today’s Progress**: Finished chapter 6 in the R manual about language obejcts.

**Thoughts:**

This chapter is a good candidate for the "if you read only one, read this"-title, R def makes more sense now. Basically, it grants access to expressions and functions after they had been parsed, but before evaluation and also allows traversing of scopes when they're evaluated, resulting in a non-standard evaluation.<br>

>`> square  <- function(x, y) {`<br>
>`+   substitute(x^2 + (2 * x * y) + y^2)`<br>
>`+ }`<br>
>`> result <- square(5, z)`<br>
>even if z == NULL no error message since y = z never gets evaluated in the function<br>
>`> result`<br>
>`5^2 + (2 * 5 * z) + z^2`<br>
>`> eval(result)`<br>
>`Error in eval(result) : object 'z' not found`<br>
>`> eval(result, list(z = 5))`<br>
>`[1] 100`<br>

I can't really blame anyone who goes for the potential of this and starts using it excessively, but for the rest of us, it seems complete witchery. :D<br>
Anyways, this chapter helped a lot. It will take some time tho, to grab all the floating functions and approaches and start tying them to their place, which they finally have.

**Link to tweet:** [Day 5](https://twitter.com/SzunTB/status/1050941702591193089)
