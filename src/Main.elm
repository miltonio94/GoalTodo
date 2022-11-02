module Main exposing (main)

import Browser
import Browser.Navigation as Nav
import Html
import Random
import Task
import Time
import Url


main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlChange = UrlChanged
        , onUrlRequest = LinkClicked
        }


init : flags -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url navKey =
    ( initModel, Cmd.none )


view : Model -> Browser.Document Msg
view model =
    { title = "Todo app", body = [] }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


type Msg
    = NewTodo
    | AddTodo
    | DeleteTodo
    | CancelTodo
    | LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url


type alias TodoItem =
    { title : String
    , createdOn : Time.Posix
    , dueDate : Maybe Time.Posix
    , id : String
    , description : String
    }


type alias Model =
    { todos : List TodoItem
    }


initModel =
    { todos = [] }
