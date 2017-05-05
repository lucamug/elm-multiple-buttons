module Buttons exposing (Model, Msg, view, update, model)

import Html exposing (Html, beginnerProgram, div, button, text, h1)
import Html.Events exposing (onClick)
import Html.Attributes exposing (style)


main =
    beginnerProgram { model = model, view = view, update = update }


type alias Model =
    { total : Total
    }


type alias Total =
    Int


type alias Increment =
    Int


type Msg
    = Add Increment


model : Model
model =
    Model 0


view : Model -> Html Msg
view model =
    div
        [ style
            [ ( "border", "2px solid #ccc" )
            , ( "background-color", "#eee" )
            , ( "display", "inline-block" )
            , ( "padding", "10px" )
            , ( "margin", "10px" )
            ]
        ]
        [ button [ onClick (Add -1) ] [ text "-" ]
        , div
            [ style
                [ ( "display", "inline-block" )
                , ( "padding", "0 10px" )
                ]
            ]
            [ text (toString model.total) ]
        , button [ onClick (Add 1) ] [ text "+" ]
        ]


update : Msg -> Model -> Model
update msg model =
    let
        _ =
            Debug.log "Buttons.update.msg" msg

        _ =
            Debug.log "Buttons.update.model" model
    in
        case msg of
            Add increment ->
                { model | total = model.total + increment }
