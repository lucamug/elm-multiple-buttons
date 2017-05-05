凸凹凸凹凸凹凸凹凸凹凸凹凸凹凸凹凸凹凸凹凸

I am trying to take the "buttons" example (http://elm-lang.org/examples/buttons) and import it from another module that would display several of them on the same page.

I am afraid that I am still thinking with components in mind, but I just want to share it anyway.

I created Main.elm that load a slightly modified version of the buttons example (Buttons.elm)

In Main.elm I have a list of Buttons.Model that I use to generate the list of buttons.

I am stucked now because I don't know how to get the necessary info from Buttons.Msg in Main.elm

I would like to have both "buttons.elm" and "main.elm" to run independently as

To see the app:

$ git clone https://github.com/lucamug/elm-multiple-buttons.git
$ cd elm-multiple-buttons/
$ elm-package install
$ elm-reactor

and open

http://localhost:8000/source/06/buttons.elm
http://localhost:8000/source/06/main.elm

