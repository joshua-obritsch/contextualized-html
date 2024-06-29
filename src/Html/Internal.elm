module Html.Internal exposing
    ( Html(..), Attribute(..)
    , decontextualizeHtml, decontextualizeAttribute
    , contextualizeHtml, contextualizeAttribute
    , usingHtml, usingAttribute
    )

{-| This module provides a set of primitives for generating context-dependent HTML elements and attributes.


# Primitives

@docs Html, Attribute


# Decontextualization

@docs decontextualizeHtml, decontextualizeAttribute


# Contextualization

@docs contextualizeHtml, contextualizeAttribute


# Context Dependency

@docs usingHtml, usingAttribute

-}

import VirtualDom



-- PRIMITIVES


{-| Represents an HTML element encompassing a context (`ctx`) and message (`msg`), also known as a contextualized HTML element.
-}
type Html ctx msg
    = Html (ctx -> VirtualDom.Node msg)


{-| Represents an HTML attribute encompassing a context (`ctx`) and message (`msg`), also known as a contextualized HTML attribute.
-}
type Attribute ctx msg
    = Attribute (ctx -> VirtualDom.Attribute msg)



-- DECONTEXTUALIZATION


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



-- CONTEXTUALIZATION


{-| Converts a decontextualized virtual DOM attribute into a contextualized HTML attribute.
-}
contextualizeAttribute : VirtualDom.Attribute msg -> Attribute ctx msg
contextualizeAttribute content =
    Attribute (\_ -> content)


{-| Converts a decontextualized virtual DOM node into a contextualized HTML element.
-}
contextualizeHtml : VirtualDom.Node msg -> Html ctx msg
contextualizeHtml content =
    Html (\_ -> content)



-- CONTEXT DEPENDENCY


{-| Establishes a dependency between a context and an HTML element.
-}
usingHtml : (ctx -> Html ctx msg) -> Html ctx msg
usingHtml decontextualize =
    Html (\ctx -> decontextualizeHtml ctx <| decontextualize ctx)


{-| Establishes a dependency between a context and an HTML attribute.
-}
usingAttribute : (ctx -> Attribute ctx msg) -> Attribute ctx msg
usingAttribute decontextualize =
    Attribute (\ctx -> decontextualizeAttribute ctx <| decontextualize ctx)
