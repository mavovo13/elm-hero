module Main exposing (Hero, Model, Msg(..), main, update, view)

import Browser
import Html exposing (Html, button, div, h1, h2, input, li, span, text, ul)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)


main =
    Browser.sandbox { init = init, update = update, view = view }


type Msg
    = Change String


type alias Hero =
    { name : String, id : Int }


type alias Model =
    { selectedHero : Maybe Hero
    , heros : List Hero
    , title : String
    }


init : Model
init =
    let
        hero =
            { id = 1, name = "Windstorm" }

        heros =
            [ { id = 1, name = "Windstorm" }, { id = 2, name = "Dr Nice" } ]
    in
    { selectedHero = Nothing, heros = heros, title = "Tour of Heroes" }


update : Msg -> Model -> Model
update msg model =
    case msg of
        Change newName ->
            let
                newHero =
                    case model.selectedHero of
                        Just hero ->
                            Just { id = hero.id, name = newName }

                        Nothing ->
                            Nothing
            in
            { model | selectedHero = newHero }


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text model.title ]
        , viewHeros model
        , viewSelectedHero model
        ]


viewHeros : Model -> Html Msg
viewHeros model =
    div []
        [ h2 [] [ text "My Heros" ]
        , ul []
            (List.map
                (\h ->
                    li []
                        [ span [] [ text (h.id |> String.fromInt) ]
                        , text h.name
                        ]
                )
                model.heros
            )
        ]


viewSelectedHero : Model -> Html Msg
viewSelectedHero model =
    case model.selectedHero of
        Just hero ->
            div []
                [ h2 [] [ text (hero.name |> String.toUpper) ]
                , div [] [ span [] [ text "id:" ], text (hero.id |> String.fromInt) ]
                , div []
                    [ text "name:"
                    , input [ value hero.name, onInput Change ] []
                    ]
                ]

        Nothing ->
            div [] []
