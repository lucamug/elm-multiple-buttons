module Buttons5 exposing (Model, view, Msg, update, model)

import Html exposing (beginnerProgram, div, button, text, h1, p)
import Html.Events exposing (onClick)


main =
    beginnerProgram { model = model, view = view, update = update }


type alias Model =
    { total : Total
    , id : Id
    }


type alias Total =
    Int


type alias Id =
    Int


type Msg
    = Add Int Id


model : Model
model =
    Model 0 555


view model =
    div []
        [ button [ onClick (Add 1 model.id) ] [ text "+" ]
        , div [] [ text (toString model.total) ]
        , button [ onClick (Add -1 model.id) ] [ text "-" ]
        ]


update msg model =
    let
        _ =
            Debug.log "buttons5:update:msg" msg

        _ =
            Debug.log "buttons5:update:model" model
    in
        case msg of
            Add value id ->
                { model | total = model.total + value }
