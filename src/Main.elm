module Main exposing (init, main, onUrlChange, onUrlRequest, subscription, update, view)

import Browser
import Html
import Random
import Task
import Time


main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscription = subscription
        , onUrlChange = onUrlChange
        , onUrlRequest = onUrlRequest
        }


init =
    identity


view =
    identity


update =
    identity


subscription =
    identity


onUrlChange =
    identity


onUrlRequest =
    identity


type alias Model =
    { todos : List TodoItem
    }


type alias TodoItem =
    { title : String
    , createdOn : Time.Posix
    , dueDate : Maybe Time.Posix
    , id : String
    , description : String
    }
