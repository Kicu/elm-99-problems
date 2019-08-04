module Helpers exposing (displayTestResults)

import Html exposing (div, hr, text, Html)

displayTestResults : List a -> Html b
displayTestResults list =
    div [] (List.intersperse (hr [] []) (List.map (\result -> text (Debug.toString result)) list))