module Main exposing (..)

import Buttons
import Html exposing (beginnerProgram, div)
import Html.Events exposing (onClick)
import Html.Attributes exposing (style)
import Array


main =
    beginnerProgram { model = model, view = view, update = update }


type alias Model =
    { buttonsList : List Int
    }


model =
    Model
        [ 0
        , 10
        , 20
        , 30
        , 4000
        ]


view model =
    div []
        (List.indexedMap
            (\a buttons ->
                Html.map
                    (Tag a)
                    (div
                        [ style
                            [ ( "border", "1px solid #aaa" )
                            , ( "background-color", "#eee" )
                            , ( "display", "inline-block" )
                            , ( "padding", "10px" )
                            , ( "margin", "10px" )
                            , ( "text-align", "center" )
                            ]
                        ]
                        [ Buttons.view buttons ]
                    )
            )
            model.buttonsList
        )


type Msg
    = Tag Int Buttons.Msg


update msg model =
    case msg of
        Tag position button_Msg ->
            let
                newButtons =
                    (Buttons.update button_Msg (getButtonsAtPosition model.buttonsList position))
            in
                { model | buttonsList = setButtonsAtPosition model.buttonsList position newButtons }


getButtonsAtPosition buttonsList position =
    let
        buttons =
            Array.get position (Array.fromList buttonsList)
    in
        case buttons of
            Nothing ->
                0

            Just val ->
                val


setButtonsAtPosition buttonsList position buttons =
    let
        buttonsArray =
            Array.fromList buttonsList

        newButtonsArray =
            Array.set position buttons buttonsArray
    in
        Array.toList newButtonsArray
