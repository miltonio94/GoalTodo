module InputFields exposing (checkboxField)

import Atom.Inputs as Inputs


type alias CheckboxField =
    { name : String
    , value : v
    , toChecked : v -> Bool
    , toMsg : v -> msg
    , label : String
    }


checkboxField =
    div
        []
        [ Inputs.CheckboxConfig
            config.name
            config.value
            config.toChecked
            config.toMsg
            |> Inputs.checkbox
        , Inputs.LabelConfig config.name config.label
            |> Inputs.label
        ]
