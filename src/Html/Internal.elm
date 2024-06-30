module Html.Internal exposing
    ( Html(..), Attribute(..)
    , contextualizeHtml, contextualizeAttribute, decontextualizeHtml, decontextualizeAttribute
    , usingHtml, usingAttribute
    )

{-| This module provides a set of internal types and functions.


# Primitives

@docs Html, Attribute


# Contextual Conversion

@docs contextualizeHtml, contextualizeAttribute, decontextualizeHtml, decontextualizeAttribute


# Contextual Dependency

@docs usingHtml, usingAttribute

-}

import VirtualDom



-- PRIMITIVES


type Html ctx msg
    = Html (ctx -> VirtualDom.Node msg)


type Attribute ctx msg
    = Attribute (ctx -> VirtualDom.Attribute msg)



-- CONTEXTUAL CONVERSION


contextualizeHtml : VirtualDom.Node msg -> Html ctx msg
contextualizeHtml html =
    Html <|
        \_ -> html


contextualizeAttribute : VirtualDom.Attribute msg -> Attribute ctx msg
contextualizeAttribute attribute =
    Attribute <|
        \_ -> attribute


decontextualizeHtml : ctx -> Html ctx msg -> VirtualDom.Node msg
decontextualizeHtml ctx (Html decontextualize) =
    decontextualize ctx


decontextualizeAttribute : ctx -> Attribute ctx msg -> VirtualDom.Attribute msg
decontextualizeAttribute ctx (Attribute decontextualize) =
    decontextualize ctx



-- CONTEXTUAL DEPENDENCY


usingHtml : (ctx -> Html ctx msg) -> Html ctx msg
usingHtml decontextualize =
    Html <|
        \ctx ->
            decontextualizeHtml ctx <|
                decontextualize ctx


usingAttribute : (ctx -> Attribute ctx msg) -> Attribute ctx msg
usingAttribute decontextualize =
    Attribute <|
        \ctx ->
            decontextualizeAttribute ctx <|
                decontextualize ctx
