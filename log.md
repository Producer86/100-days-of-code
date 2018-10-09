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

So I'm looking forward to learning more about these things called classes, whatever they are.

**Link to Twitter:** [Twitter](https://twitter.com/SzunTB)

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

**Link to Twitter:** [Twitter](https://twitter.com/SzunTB)
