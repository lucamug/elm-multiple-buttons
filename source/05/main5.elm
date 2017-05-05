module Main5 exposing (..)

import Buttons5
import Html exposing (beginnerProgram, div, button, text, h1, p)
import Html.Events exposing (onClick)
import Array


main =
    beginnerProgram { model = model2, view = view, update = update }


type alias Model =
    { buttonList : List Buttons5.Model
    }


type alias ButtonsList =
    List Buttons5.Model


model2 =
    Model
        [ Buttons5.Model 0 9999
        , Buttons5.Model 1000 8888
        ]


view model =
    div []
        [ Html.map Tag (Buttons5.view (getButtons model2.buttonList 0))
        , Html.map Tag (Buttons5.view (getButtons model2.buttonList 1))
        , Html.map Tag (Buttons5.view (getButtons model2.buttonList 2))
        , Html.map Tag (Buttons5.view (getButtons model2.buttonList 3))
        , Html.map Tag (Buttons5.view (getButtons model2.buttonList 4))
        , Html.map Tag (Buttons5.view (getButtons model2.buttonList 5))
        ]


type Msg
    = Tag Buttons5.Msg


update msg model =
    case msg of
        Tag button5_Msg ->
            let
                id =
                    Debug.log "Need to extract the id from main5:update:msg:button5_Msg" button5_Msg

                newButtons =
                    -- The problem is in the next line.
                    -- How can I extract the Id from button5_Msg?
                    -- I need to pass the proper buttons
                    (Buttons5.update button5_Msg (getButtons model2.buttonList 1))

                _ =
                    Debug.log "main5:update:id" newButtons.id
            in
                -- This need to be built once I will be
                -- able to get the right Id here
                model


getButtons : ButtonsList -> Int -> Buttons5.Model
getButtons buttonsList position =
    let
        buttons =
            Array.get position (Array.fromList buttonsList)
    in
        case buttons of
            Nothing ->
                Buttons5.Model 0 9999

            Just val ->
                val
