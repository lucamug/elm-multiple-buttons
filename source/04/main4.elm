module Main4 exposing (..)

import Buttons4
import Html exposing (beginnerProgram, div, button, text, h1, p)
import Html.Events exposing (onClick)


main =
    beginnerProgram { model = init, view = view, update = update }


init =
    Buttons4.Model 0 9999


view model =
    div []
        [ h1 [] [ text "Main4" ]
        , p [] [ text "Added the Id for Buttons" ]
        , Html.map Tag (Buttons4.view model)
        , Html.map Tag (Buttons4.view model)
        ]


type Msg
    = Tag Buttons4.Msg


update msg model =
    case Debug.log "buttons:msg" msg of
        Tag msgButton ->
            Buttons4.update msgButton model
