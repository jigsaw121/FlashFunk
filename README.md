FlashFunk
=======

Additional base code and scripting tools for [FlashPunk](https://github.com/Draknek/FlashPunk). See ExampleWorld's spawn() function and the entities within for an easily configurable example, which results in this little game: https://dl.dropboxusercontent.com/u/75065952/fp-base.swf

Sort of a fusion of OO and script components. In a nutshell, toss Gentity descendants into a GenWorld descendant, add Script descendants for a Gentity descendant. Scripts are used to describe the behaviours of a Gentity, allowing you to work with rules/constraints instead of plain sequential piles of code. Script constructs such as always(f), when(f){g} and delay(n){f} are available to make life easier. 
