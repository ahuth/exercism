# Hello World

The classical introductory exercise. Just say "Hello, World!"

["Hello, World!"](http://en.wikipedia.org/wiki/%22Hello,_world!%22_program) is
the traditional first program for beginning programming in a new language
or environment.

The objectives are simple:

- Write a function that returns the string "Hello, World!".
- Run the test suite and make sure that it succeeds.
- Submit your solution and check it at the website.

If everything goes well, you will be ready to fetch your first real exercise.

The Scala exercises assume an SBT project scheme. The exercise solution source
should be placed within the exercise directory/src/main/scala. The exercise
unit tests can be found within the exercise directory/src/test/scala.

To run the tests simply run the command `sbt test` in the exercise directory.

For more detailed info about the Scala track see the [help
page](http://exercism.io/languages/scala).


## Hints
For this exercise two Scala features come in handy:
- [Default Parameter Values](http://docs.scala-lang.org/tutorials/tour/default-parameter-values.html)
- [String Interpolation](http://docs.scala-lang.org/overviews/core/string-interpolation.html)

#### Common pitfalls that you should avoid
- `null` is usually not considered a valid value in Scala, and there are no `null` checks needed (if you don't have to interface with Java code, say). Instead there is the [Option](http://danielwestheide.com/blog/2012/12/19/the-neophytes-guide-to-scala-part-5-the-option-type.html) type if you want to express the possible absence of a value. But for this exercise just assume a normal non-`null` String parameter.
- Usually there is no need in Scala to use `return`. For a discussion see [here](http://stackoverflow.com/questions/24856106/return-in-a-scala-function-literal). Or as a quote from that discussion: *Don't use return, it makes Scala cry.*

## Source

This is an exercise to introduce users to using Exercism [http://en.wikipedia.org/wiki/%22Hello,_world!%22_program](http://en.wikipedia.org/wiki/%22Hello,_world!%22_program)

## Submitting Incomplete Problems
It's possible to submit an incomplete solution so you can see how others have completed the exercise.

