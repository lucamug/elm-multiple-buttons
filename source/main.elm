module Main exposing (..)

import Buttons
import Html exposing (beginnerProgram, div)
import Html.Events exposing (onClick)
import Html.Attributes exposing (style)
import Array


main =
    beginnerProgram
        { model = [ 0, 10, 20, 30, 4000, -1 ]
        , view = view
        , update = update
        }


view model =
    div []
        (List.indexedMap
            (\index element ->
                Html.map
                    (Tag index)
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
                        [ Buttons.view element ]
                    )
            )
            model
        )


type Msg
    = Tag Int Buttons.Msg


getButtons model index =
    let
        buttons =
            Array.get index (Array.fromList model)
    in
        case buttons of
            Nothing ->
                0

            Just val ->
                val


setButtons model index buttons =
    let
        buttonsArray =
            Array.fromList model

        newButtonsArray =
            Array.set index buttons buttonsArray
    in
        Array.toList newButtonsArray


update msg model =
    case msg of
        Tag index buttons_Msg ->
            let
                oldButtons =
                    getButtons model index

                newButtons =
                    Buttons.update buttons_Msg oldButtons
            in
                setButtons model index newButtons
