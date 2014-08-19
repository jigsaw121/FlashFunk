FlashFunk
=======

FlashFunk is a third-party extension library to FlashPunk, offering things like scripting tools, state machines, and generally helper basecode that speeds up development. It's designed with game jams in mind, and has been tested out in a few projects. 

FlashFunk shifts the focus towards working with ideas and behaviours. Passing around functions just like any other data is a staple of Flashfunk. Relax and write things the obvious way without the environment's control flow interrupting your train of thought. Minimize the use of copypasting, throwaway variables, and programming "sub-tasks" that force you to switch to another environment before you can achieve your current task.

-

Here's a crash course of some usable Flashfunk features. Note that as Flashfunk is still experimental and essentially basecode for my own purposes, there are quite a few unfinished and undocumented things left in this build. But you can already go far with the following.

General

Inherit from GenWorld to define scenes. Inherit from Gentity to define entities, then toss them to a GenWorld. Give entities scripts and states to define behaviour. Use closures, helper methods and newfangled scripty features to your advantage.

Override a Gentity's *init methods to define scripts, states, images. Refer to the world with the 'host' variable. Search for other entities with 'all' and apply some function to multiple entities with 'every'. See also Gentity.as for extra info and assorted helper methods.

Scripts

Scripts are the core of Flashfunk. They're objects that can be added to and removed from entities, and describe some sort of behaviour. Entities should use exclusively scripts for their game logic - in contrast with Flashpunk, instead of overriding the 'update' method, add scripts with function parameters to entities.

always(func) simply repeats the function 'func' every frame.
delay(frames, func) triggers 'func' after the desired amount of frames, then removes itself.
repeat(frames, func) is the same as 'delay', except it doesn't remove itself when 'func' is triggered.
when(cond, func) takes a condition function 'cond' in addition to the action function 'func'. 'cond' must return a boolean, and when it returns true, 'func' is triggered. Removes itself on successful trigger.
whenever(cond, func) is the same as 'when', except it doesn't remove itself when 'func' is triggered.
until(cond, func) repeats 'func' every frame until 'cond' returns true.
oncollision(type, func) executes 'func' whenever a collision with an object of the desired type is detected. One object is passed to 'func' at a time for processing, so correspondingly it needs to take one argument.
onclick(func) and onhover(func) trigger 'func' based on mouse behaviour.

All of these Gentity methods define a script and add it to the entity for convenience. They also return the Script object for later reference, such as having only one copy of a script used in several places. Scripts can be manually added with add_script(sc) or removed with remove_script(sc). Once a script is added to an entity, its 'target' variable is set to that entity.

When passing callbacks to scripts, be vary of closure scopes messing with the 'this' keyword! Consider defining complicated functions as an entity's methods.

States

States help you think about game logic on the behaviour level. They're essentially a way to define entities' changing behaviour in flowchart form, and go well with scripts.

'onstate' and 'offstate' are used for initialization/termination of state assets. They define instantaneous actions taken on state transitions, such as switching an image, and consequently take functions as arguments. If you allocate a resource on some state and don't wish for it to remain after leaving the state, make sure to meet your 'onstate' call with a corresponding 'offstate' call. The transition itself is tone with a 'tostate' call.

'duringstate' is the actual behaviour that happens during a state. If, for example, an entity's movement pattern changes, it's best to implement the patterns as two separate methods and script them into different states.

duringstate("walking", always(walk))
onstate("onladder", function():void { trace("Getting on a ladder") })
duringstate("onladder", always(climb))
offstate("onladder", function():void { trace("Getting off a ladder") })
tostate("walking")

What 'duringstate' does in a nutshell is that it associates a script with a state. A script is added when transitioning to the state(s) with which it is associated, and removed again on transitions away. Note that there is no need to explicity "declare" a state. Rather, you only link behaviours to string ids. Transitioning into a state with no associated behaviour simply means there won't be any associated behaviour. 

-

Now go make a game.