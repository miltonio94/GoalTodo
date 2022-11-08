module Inputs exposing (CheckboxConfig, LabelConfig, checkbox, label)

import Html exposing (Html)
import Html.Attributes exposing (checked, for, name, type_, value)
import Html.Event exposing (onInput)


type alias CheckboxConfig =
    { name : String
    , value : value
    , valueToString : value -> String
    , valueToChecked : value -> Bool
    , toMsg : value -> msg
    }


type alias LabelConfig =
    { belongsto : String
    , text : String
    }



-- Should the checkbox be it's own atom without a label?
-- or is it okay to keep the label as part of an atom
-- maybe the checkbox with the label should be upgraded to molecule status
-- checkboxConfig


typeCheckbox =
    type_ "checkbox"


checkbox : CheckboxConfig -> Html msg
checkbox config =
    Html.input
        [ typeCheckbox
        , onInput config.toMsg
        , name config.name
        , value config.value
        , checked config.checked
        ]
        []


label : LabelConfig -> Html msg
label config =
    Html.label [ for config.belongsTo ] [ Html.text config.text ]
