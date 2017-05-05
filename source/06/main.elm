module Main exposing (..)

import Buttons
import Html exposing (beginnerProgram, div)
import Html.Events exposing (onClick)
import Array


main =
    beginnerProgram { model = model, view = view, update = update }


type alias Model =
    { buttonsList : List Buttons.Model
    }


type alias ButtonsList =
    List Buttons.Model


model =
    Model
        [ Buttons.Model 0
        , Buttons.Model 10
        , Buttons.Model 20
        , Buttons.Model 30
        ]


view model =
    div []
        (List.indexedMap (\position buttons -> Html.map (Tag position) (Buttons.view position buttons)) model.buttonsList)


type Msg
    = Tag Int Buttons.Msg


update msg model =
    case msg of
        Tag position button_Msg ->
            let
                _ =
                    Debug.log "Main.update.msg" msg

                _ =
                    Debug.log "Main.update.model" model

                _ =
                    Debug.log "Need to extract the Position from this message:" button_Msg

                newButtons =
                    (Buttons.update button_Msg (getButtonsAtPosition model.buttonsList position))
            in
                { model | buttonsList = setButtonsAtPosition model.buttonsList position newButtons }


getButtonsAtPosition : ButtonsList -> Buttons.Position -> Buttons.Model
getButtonsAtPosition buttonsList position =
    let
        buttons =
            Array.get position (Array.fromList buttonsList)
    in
        case buttons of
            Nothing ->
                Buttons.Model 0

            Just val ->
                val


setButtonsAtPosition : ButtonsList -> Buttons.Position -> Buttons.Model -> ButtonsList
setButtonsAtPosition buttonsList position buttons =
    let
        buttonsArray =
            Array.fromList buttonsList

        newButtonsArray =
            Array.set position buttons buttonsArray
    in
        Array.toList newButtonsArray
