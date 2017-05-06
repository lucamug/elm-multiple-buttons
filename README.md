凸凹凸凹凸凹凸凹凸凹凸凹凸凹凸凹凸凹凸凹凸

Recycling Elm code transforming it in a module

I took the official "buttons" example (http://elm-lang.org/examples/buttons) and loaded from another module.

The only difference in the "buttons" example code is the addition of this line at the top

	module Buttons exposing (view, Msg, update)

To see the code:

    $ git clone https://github.com/lucamug/elm-multiple-buttons.git
    $ cd elm-multiple-buttons/
    $ elm-reactor

and open

 - http://localhost:8000/source/buttons.elm
 - http://localhost:8000/source/main.elm

The cool things is that the imported module can also be execute independently.

Thank you to Chad Gilbert for fixing one problem here

https://stackoverflow.com/questions/43808042/how-to-extract-information-from-a-message-of-an-imported-module
