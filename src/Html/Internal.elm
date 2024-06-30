module Html.Internal exposing
    ( Html(..), Attribute(..)
    , contextualizeHtml, contextualizeAttribute, decontextualizeHtml, decontextualizeAttribute
    , usingHtml, usingAttribute
    , mapElement, mapAttribute
    , textNode
    , parentElement, leafElement
    , property, boolProperty, floatProperty, intProperty, stringProperty
    , attribute
    )

{-| This module provides a set of internal types and functions.


# Primitives

@docs Html, Attribute


# Contextual Conversion

@docs contextualizeHtml, contextualizeAttribute, decontextualizeHtml, decontextualizeAttribute


# Contextual Dependency

@docs usingHtml, usingAttribute


# Transformations

@docs mapElement, mapAttribute


# Text

@docs textNode


# Custom Elements

@docs parentElement, leafElement


# Custom Properties

@docs property, boolProperty, floatProperty, intProperty, stringProperty


# Custom Attributes

@docs attribute

-}

import Json.Encode as Json
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
contextualizeAttribute attr =
    Attribute <|
        \_ -> attr


decontextualizeHtml : ctx -> Html ctx msg -> VirtualDom.Node msg
decontextualizeHtml context (Html decontextualize) =
    decontextualize context


decontextualizeAttribute : ctx -> Attribute ctx msg -> VirtualDom.Attribute msg
decontextualizeAttribute context (Attribute decontextualize) =
    decontextualize context



-- CONTEXTUAL DEPENDENCY


usingHtml : (ctx -> Html ctx msg) -> Html ctx msg
usingHtml decontextualize =
    Html <|
        \context ->
            decontextualizeHtml context <|
                decontextualize context


usingAttribute : (ctx -> Attribute ctx msg) -> Attribute ctx msg
usingAttribute decontextualize =
    Attribute <|
        \context ->
            decontextualizeAttribute context <|
                decontextualize context



-- TRANSFORMATIONS


mapElement : (a -> b) -> Html ctx a -> Html ctx b
mapElement transform element =
    Html <|
        \context ->
            VirtualDom.map transform <|
                decontextualizeHtml context element


mapAttribute : (a -> b) -> Attribute ctx a -> Attribute ctx b
mapAttribute transform attr =
    Attribute <|
        \context ->
            VirtualDom.mapAttribute transform <|
                decontextualizeAttribute context attr



-- TEXT


textNode : String -> Html ctx msg
textNode text =
    Html <|
        \_ -> VirtualDom.text text



-- CUSTOM ELEMENTS


parentElement : String -> List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
parentElement name attributes children =
    Html <|
        \context ->
            VirtualDom.node
                name
                (List.map (decontextualizeAttribute context) attributes)
                (List.map (decontextualizeHtml context) children)


leafElement : String -> List (Attribute ctx msg) -> Html ctx msg
leafElement name attributes =
    Html <|
        \context ->
            VirtualDom.node
                name
                (List.map (decontextualizeAttribute context) attributes)
                []



-- CUSTOM PROPERTIES


property : String -> Json.Value -> Attribute ctx msg
property key value =
    Attribute <|
        \_ -> VirtualDom.property key value


boolProperty : String -> Bool -> Attribute ctx msg
boolProperty key value =
    Attribute <|
        \_ -> VirtualDom.property key (Json.bool value)


floatProperty : String -> Float -> Attribute ctx msg
floatProperty key value =
    Attribute <|
        \_ -> VirtualDom.property key (Json.float value)


intProperty : String -> Int -> Attribute ctx msg
intProperty key value =
    Attribute <|
        \_ -> VirtualDom.property key (Json.int value)


stringProperty : String -> String -> Attribute ctx msg
stringProperty key value =
    Attribute <|
        \_ -> VirtualDom.property key (Json.string value)



-- CUSTOM ATTRIBUTES


attribute : String -> String -> Attribute ctx msg
attribute key value =
    Attribute <|
        \_ -> VirtualDom.attribute key value
