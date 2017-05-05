module Buttons4 exposing (Model, view, Msg, update)

import Html exposing (beginnerProgram, div, button, text, h1, p)
import Html.Events exposing (onClick)


main =
    beginnerProgram { model = init, view = view, update = update }


type alias Model =
    { counter : Counter
    , id : Id
    }


type alias Counter =
    Int


type alias Id =
    Int


type Msg
    = Add Int Id


init : Model
init =
    Model 0 9999


view model =
    div []
        [ h1 [] [ text "Buttons4" ]
        , p [] [ text "Added id key inside the Model" ]
        , div [] [ text ("Buttons Id: " ++ toString model.id) ]
        , button [ onClick (Add 1 model.id) ] [ text "+" ]
        , div [] [ text (toString model.counter) ]
        , button [ onClick (Add -1 model.id) ] [ text "-" ]
        ]


update msg model =
    case Debug.log "button:msg" msg of
        Add value id ->
            { model | counter = model.counter + value }
