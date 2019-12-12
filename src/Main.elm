module Main exposing (Hero, Model, Msg(..), main, update, view)

import Browser
import Html exposing (Html, button, div, h1, h2, input, span, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)


main =
    Browser.sandbox { init = init, update = update, view = view }


type Msg
    = Change String


type alias Hero =
    { name : String, id : Int }


type alias Model =
    { hero : Hero
    , title : String
    }


init : Model
init =
    let
        hero =
            { id = 1, name = "Windstorm" }
    in
    { hero = hero, title = "Tour of Heroes" }


update : Msg -> Model -> Model
update msg model =
    case msg of
        Change newName ->
            let
                newHero =
                    { id = model.hero.id, name = newName }
            in
            { model | hero = newHero }


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text model.title ]
        , h2 [] [ text (model.hero.name |> String.toUpper) ]
        , div [] [ span [] [ text "id:" ], text (model.hero.id |> String.fromInt) ]
        , div []
            [ text "name:"
            , input [ value model.hero.name, onInput Change ] []
            ]
        ]
