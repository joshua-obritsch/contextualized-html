module Html.Events exposing (onauxclick, onbeforeinput, click, input)

{-| HTML Events


# Table of Contents

  - Events
      - [auxclick](#auxclick)
      - [beforeinput](#beforeinput)


# Documentation


## Events

@docs onauxclick, onbeforeinput, click, input

-}

import Html.Attributes exposing (Attribute(..))
import Json.Decode as Json
import VirtualDom


{-| Constructs a contextualized HTML `auxclick` event handler.
-}
onauxclick : msg -> Attribute ctx msg
onauxclick event =
    on "auxclick" event


{-| Constructs a contextualized HTML `beforeinput` event handler.
-}
onbeforeinput : msg -> Attribute ctx msg
onbeforeinput event =
    on "beforeinput" event


{-| Constructs a contextualized HTML `click` event handler.
-}
click : msg -> Attribute ctx msg
click event =
    on "click" event


{-| Constructs a contextualized HTML `input` event handler.
-}
input : msg -> Attribute ctx msg
input event =
    on "input" event



-- PRIVATE


on : String -> msg -> Attribute ctx msg
on event decoder =
    Attribute (\_ -> VirtualDom.on event <| VirtualDom.Normal <| Json.succeed decoder)
