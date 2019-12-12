import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)

main =
  Browser.sandbox { init = 0, update = update, view = view }

type Msg
    = NoOp

update msg model =
  case msg of
    NoOp ->
      model + 1

view model =
  div []
    [div [] [ text "hello"]
    ]