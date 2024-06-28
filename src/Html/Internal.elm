module Html.Internal exposing
    ( Attribute(..)
    , Html(..)
    )

{-| Contextualized HTML
-}

import VirtualDom


{-| Represents an HTML element encompassing a context (`ctx`) and message (`msg`), also known as a contextualized HTML element.

The context can be used to facilitate the propagation of globally shared state to child nodes. This is ideal for pieces of state that seldom
change but are frequently used throughout the codebase such as the language, theme, or timezone.

A message can be triggered to emit an event that updates a piece of state.

-}
type Html ctx msg
    = Html (ctx -> VirtualDom.Node msg)


{-| Represents an HTML attribute encompassing a context (`ctx`) and message (`msg`), also known as a contextualized HTML attribute.
-}
type Attribute ctx msg
    = Attribute (ctx -> VirtualDom.Attribute msg)


{-| Converts a contextualized HTML element into a decontextualized virtual DOM node.
-}
decontextualizeHtml : ctx -> Html ctx msg -> VirtualDom.Node msg
decontextualizeHtml ctx (Html decontextualize) =
    decontextualize ctx


{-| Converts a contextualized HTML attribute into a decontextualized virtual DOM attribute.
-}
decontextualizeAttribute : ctx -> Attribute ctx msg -> VirtualDom.Attribute msg
decontextualizeAttribute ctx (Attribute decontextualize) =
    decontextualize ctx


{-| Converts a decontextualized virtual DOM node into a contextualized HTML element.
-}
contextualizeHtml : VirtualDom.Node msg -> Html ctx msg
contextualizeHtml content =
    Html (\_ -> content)


{-| Converts a decontextualized virtual DOM attribute into a contextualized HTML attribute.
-}
contextualizeAttribute : VirtualDom.Attribute msg -> Attribute ctx msg
contextualizeAttribute content =
    Attribute (\_ -> content)


{-| Constructs a customized HTML element.
-}
customElement : String -> List (Attribute glc msg) -> List (Html glc msg) -> Html glc msg
customElement name attributes children =
    Html <|
        \glc ->
            VirtualDom.node
                name
                (List.map (decontextualizeAttribute glc) attributes)
                (List.map (decontextualizeHtml glc) children)


{-| Constructs a contextualized HTML `div` element with the given attributes and children.
-}
div : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
div =
    customElement "div"


{-| Constructs a contextualized HTML `button` element with the given attributes and children.
-}
button : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
button =
    customElement "button"


{-| Constructs a contextualized HTML `text` element with the given text.
-}
text : String -> Html ctx msg
text ctx =
    Html <|
        \_ ->
            VirtualDom.text ctx
