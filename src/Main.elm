module Main exposing (main)

import Browser
import Browser.Navigation as Nav
import Html exposing (Html)
import Html.Attributes as Attributes
import Random
import Task
import Time
import Url



-- main : Program Model Model Msg


main =
    Browser.sandbox
        { init = initModel
        , view = view
        , update = update

        -- , subscriptions = subscriptions
        -- , onUrlChange = UrlChanged
        -- , onUrlRequest = LinkClicked
        }



-- init : flags -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
-- init flags url navKey =
--     ( [], Cmd.none )


view : Model -> Html.Html msg
view model =
    Html.div
        []
        [ todoForm
        ]


todoForm : Html.Html msg
todoForm =
    Html.div [] []


update : Msg -> Model -> Model
update msg model =
    model


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


type Msg
    = NewTodo
    | AddTodo
    | DeleteTodo
    | CancelTodo



-- | LinkClicked Browser.UrlRequest
-- | UrlChanged Url.Url


type alias TodoItem =
    { title : String
    , createdOn : String
    , dueDate : Maybe String
    , id : String
    , description : String
    }


type alias Model =
    { todos : List TodoItem }


initModel : Model
initModel =
    { todos = [] }
