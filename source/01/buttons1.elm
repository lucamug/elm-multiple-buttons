module Buttons1 exposing (..)

import Html exposing (beginnerProgram, div, button, text, h1, p)
import Html.Events exposing (onClick)


main =
    beginnerProgram { model = 0, view = view, update = update }


view model =
    div []
        [ h1 [] [ text "Buttons1" ]
        , p [] [ text "Original version as per http://elm-lang.org/examples/buttons" ]
        , button [ onClick Decrement ] [ text "-" ]
        , div [] [ text (toString model) ]
        , button [ onClick Increment ] [ text "+" ]
        ]


type Msg
    = Increment
    | Decrement


update msg model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            model - 1
