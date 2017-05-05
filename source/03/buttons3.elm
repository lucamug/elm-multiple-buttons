module Buttons3 exposing (Model, view, Msg, update)

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
        [ h1 [] [ text "Buttons3" ]
        , p [] [ text "Same as Buttons2" ]
        , button [ onClick (Add 1) ] [ text "+" ]
        , div [] [ text (toString model) ]
        , button [ onClick (Add -1) ] [ text "-" ]
        ]


update msg model =
    case Debug.log "button:msg" msg of
        Add value ->
            model + value
