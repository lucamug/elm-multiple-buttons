module Buttons exposing (Model, Msg, Position, view, update, model)

import Html exposing (Html, beginnerProgram, div, button, text, h1)
import Html.Events exposing (onClick)
import Html.Attributes exposing (style)


main =
    beginnerProgram { model = model, view = (view 999), update = update }


type alias Model =
    { total : Total
    }


type alias Total =
    Int


type alias Position =
    Int


type alias Increment =
    Int


type Msg
    = Add Increment Position


model : Model
model =
    Model 0


view : Position -> Model -> Html Msg
view position model =
    div
        [ style
            [ ( "border", "2px solid #ccc" )
            , ( "background-color", "#eee" )
            , ( "display", "inline-block" )
            , ( "padding", "10px" )
            , ( "margin", "10px" )
            ]
        ]
        [ div [] [ text ("Position: " ++ toString position) ]
        , button [ onClick (Add -1 position) ] [ text "-" ]
        , div
            [ style
                [ ( "display", "inline-block" )
                , ( "padding", "0 10px" )
                ]
            ]
            [ text (toString model.total) ]
        , button [ onClick (Add 1 position) ] [ text "+" ]
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
            Add increment position ->
                { model | total = model.total + increment }
