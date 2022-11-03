module Main exposing (main)

import Browser
import Browser.Navigation as Nav
import Html exposing (Html)
import Html.Attributes as Attributes
import Html.Events as Events
import List
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


view : Model -> Html.Html Msg
view model =
    Html.div
        [ Attributes.class "main" ]
        [ case model.view of
            Home ->
                Html.div []
                    [ Html.div [] (List.map renderListItem model.todos)
                    , Html.div [] [ newListItemButton ]
                    ]

            NewListItem ->
                todoForm model
        ]


renderListItem : TodoItem -> Html Msg
renderListItem todo =
    Html.div
        []
        [ case todo.status of
            Done ->
                Html.u [] [ Html.text todo.title ]

            Pending ->
                Html.text todo.title
        ]


newListItemButton : Html Msg
newListItemButton =
    Html.div
        []
        [ Html.button [ Events.onClick NewTodo ] [ Html.text "Add new todo item" ]
        ]


todoForm : Model -> Html.Html Msg
todoForm model =
    Html.div
        []
        [ textInput "Todo" model.newTodo TodoInput
        , Html.button [ Events.onClick AddTodo ] [ Html.text "create" ]
        ]


textInput : String -> String -> (String -> Msg) -> Html Msg
textInput placeholder value toMsg =
    Html.input [ Attributes.type_ "text", Attributes.placeholder placeholder, Attributes.value value, Events.onInput toMsg ] []


checkboxInput : String -> String -> String -> Bool -> (String -> Msg) -> Html Msg
checkboxInput label name value isChecked toMsg =
    Html.input
        [ Attributes.type_ "checkbox"
        , Attributes.name name
        , Attributes.value value
        , Attributes.checked isChecked
        , Events.onInput toMsg
        ]
        []


update : Msg -> Model -> Model
update msg model =
    case msg of
        NewTodo ->
            { model | view = NewListItem }

        TodoInput text ->
            { model | newTodo = text }

        AddTodo ->
            { model
                | todos =
                    (::) { title = model.newTodo, status = Pending, id = "todo" ++ String.fromInt model.nextId } model.todos
                , newTodo = ""
                , view = Home
                , nextId = model.nextId + 1
            }

        _ ->
            model


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


type Msg
    = NewTodo
    | TodoDone String
    | TodoInput String
    | AddTodo
    | DeleteTodo
    | CancelTodo


type Page
    = Home
    | NewListItem


type TodoStatus
    = Done
    | Pending



-- | ListView
-- | LinkClicked Browser.UrlRequest
-- | UrlChanged Url.Url


type alias TodoItem =
    { title : String
    , status : TodoStatus
    , id : String

    -- , createdOn : String
    -- , dueDate : Maybe String
    -- , id : String
    -- , description : String
    }


type alias Model =
    { nextId : Int
    , view : Page
    , todos : List TodoItem
    , newTodo : String
    }


initModel : Model
initModel =
    { view = Home
    , newTodo = ""
    , todos = []
    , nextId = 0
    }
