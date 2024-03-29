module Problem_19 exposing (main, rotate, test)

import Html exposing (..)
import List
import Helpers exposing (displayTestResults)


rotate : Int -> List a -> List a
rotate rot list =
    let
        remainderRot =
            remainderBy (List.length list) rot

        elemCount =
            if remainderRot >= 0 then
                remainderRot

            else
                List.length list + remainderRot
    in
    List.drop elemCount list ++ List.take elemCount list


main : Html a
main =
    div []
        [ text <|
            case test of
                0 ->
                    "Your implementation passed all tests."

                1 ->
                    "Your implementation failed one test."

                x ->
                    "Your implementation failed " ++ Debug.toString x ++ " tests."
        , hr [] []
        , displayTestResults tests
        ]


test : Int
test =
    List.length <|
        List.filter ((==) False)
            [ rotate 3 [ 1, 2, 5, 5, 2, 1 ] == [ 5, 2, 1, 1, 2, 5 ]
            , rotate 13 (List.range 1 10) == [ 4, 5, 6, 7, 8, 9, 10, 1, 2, 3 ]
            , rotate 1 (List.range 1 5) == [ 2, 3, 4, 5, 1 ]
            , rotate 0 (List.range 1 5) == [ 1, 2, 3, 4, 5 ]
            , rotate -1 (List.range 1 5) == [ 5, 1, 2, 3, 4 ]
            , rotate -6 (List.range 1 5) == [ 5, 1, 2, 3, 4 ]
            , rotate 3 (List.range 1 5) == [ 4, 5, 1, 2, 3 ]
            , rotate 1 [ "1", "2", "3", "4" ] == [ "2", "3", "4", "1" ]
            , rotate 1 [] == []
            ]


tests =
    [ rotate 3 [ 1, 2, 5, 5, 2, 1 ]
    , rotate 13 (List.range 1 10)
    , rotate 1 (List.range 1 5)
    , rotate 0 (List.range 1 5)
    , rotate -1 (List.range 1 5)
    , rotate -6 (List.range 1 5)
    , rotate 3 (List.range 1 5)
--    , rotate 1 [ "1", "2", "3", "4" ]
    , rotate 1 []
    ]
