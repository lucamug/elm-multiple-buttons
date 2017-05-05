module Main3 exposing (..)

import Buttons3
import Html exposing (beginnerProgram, div, button, text, h1, p)
import Html.Events exposing (onClick)


main =
    beginnerProgram { model = 0, view = view, update = update }


view model =
    div []
        [ h1 [] [ text "Main3" ]
        , p [] [ text "Create a Main module that add several buttons using Html.map. It works but all instances of buttons share the same model value." ]
        , Html.map Tag (Buttons3.view model)
        , Html.map Tag (Buttons3.view model)
        ]


type Msg
    = Tag Buttons3.Msg


update msg model =
    case Debug.log "buttons:msg" msg of
        Tag msgButton ->
            Buttons3.update msgButton model
