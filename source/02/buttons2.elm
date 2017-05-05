module Buttons2 exposing (Model, view, Msg, update)

import Html exposing (beginnerProgram, div, button, text, h1, p)
import Html.Events exposing (onClick)


main =
    beginnerProgram { model = init, view = view, update = update }


type alias Model =
    Int


type Msg
    = Add Int


init : Model
init =
    0


view model =
    div []
        [ h1 [] [ text "Buttons2" ]
        , p [] [ text "Added a paramenter to the Increment Msg so now the calue to increment is a parameter and the Decrement Msg is not needed anymore." ]
        , button [ onClick (Add 10) ] [ text "+10" ]
        , div [] [ text (toString model) ]
        , button [ onClick (Add -10) ] [ text "-10" ]
        ]


update msg model =
    case Debug.log "button:msg" msg of
        Add value ->
            model + value
