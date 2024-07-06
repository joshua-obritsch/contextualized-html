module Html.Attributes exposing
    ( Attribute(..)
    , contextualize, decontextualize, using
    , abbr, accept, acceptCharset, accesskey, action, allow, allowfullscreen, alt, as_, autocapitalize, autocomplete, autofocus, autoplay, blocking, charset, checked, cite, class, color, cols, colspan, content, contenteditable, controls, coords, crossorigin, data, datetime, decoding, default, dir, dirname, disabled, download, draggable, enctype, enterkeyhint, fetchpriority, for, form, formaction, formenctype, formmethod, formnovalidate, formtarget, headers, height, hidden, high, href, hreflang, httpEquiv, id, imagesizes, imagesrcset, inert, inputmode, integrity, is, ismap, itemid, itemprop, itemref, itemscope, itemtype, kind, label, lang, list, loading, loop, low, max, maxlength, media, method, min, minlength, multiple, muted, name, nonce, novalidate, open, optimum, pattern, ping, placeholder, playsinline, popover, popovertarget, popovertargetaction, poster, preload, readonly, referrerpolicy, rel, required, reversed, rows, rowspan, sandbox, scope, selected, shadowrootclonable, shadowrootdelegatesfocus, shadowrootmode, shadowrootserializable, shape, size, sizes, slot, span, spellcheck, src, srcdoc, srclang, srcset, start, step, style, tabindex, target, title, translate, type_, usemap, value, width, wrap, writingsuggestions
    )

{-| This module provides a set of types and functions for generating context-dependent HTML attributes.


# Table of Contents

  - Types
      - [Attribute](#Attribute)

  - Contextualization
      - [contextualize](#contextualize)
      - [decontextualize](#decontextualize)
      - [using](#using)

  - Attributes
      - [abbr](#abbr)
      - [accept](#accept)
      - [acceptCharset](#acceptCharset)
      - [accesskey](#accesskey)
      - [action](#action)
      - [allow](#allow)
      - [allowfullscreen](#allowfullscreen)
      - [alt](#alt)
      - [as\_](#as_)
      - [autocapitalize](#autocapitalize)
      - [autocomplete](#autocomplete)
      - [autofocus](#autofocus)
      - [autoplay](#autoplay)
      - [blocking](#blocking)
      - [charset](#charset)
      - [checked](#checked)
      - [cite](#cite)
      - [class](#class)
      - [color](#color)
      - [cols](#cols)
      - [colspan](#colspan)
      - [content](#content)
      - [contenteditable](#contenteditable)
      - [controls](#controls)
      - [coords](#coords)
      - [crossorigin](#crossorigin)
      - [data](#data)
      - [datetime](#datetime)
      - [decoding](#decoding)
      - [default](#default)
      - [dir](#dir)
      - [dirname](#dirname)
      - [disabled](#disabled)
      - [download](#download)
      - [draggable](#draggable)
      - [enctype](#enctype)
      - [enterkeyhint](#enterkeyhint)
      - [fetchpriority](#fetchpriority)
      - [for](#for)
      - [form](#form)
      - [formaction](#formaction)
      - [formenctype](#formenctype)
      - [formmethod](#formmethod)
      - [formnovalidate](#formnovalidate)
      - [formtarget](#formtarget)
      - [headers](#headers)
      - [height](#height)
      - [hidden](#hidden)
      - [high](#high)
      - [href](#href)
      - [hreflang](#hreflang)
      - [httpEquiv](#httpEquiv)
      - [id](#id)
      - [imagesizes](#imagesizes)
      - [imagesrcset](#imagesrcset)
      - [inert](#inert)
      - [inputmode](#inputmode)
      - [integrity](#integrity)
      - [is](#is)
      - [ismap](#ismap)
      - [itemid](#itemid)
      - [itemprop](#itemprop)
      - [itemref](#itemref)
      - [itemscope](#itemscope)
      - [itemtype](#itemtype)
      - [kind](#kind)
      - [label](#label)
      - [lang](#lang)
      - [list](#list)
      - [loading](#loading)
      - [loop](#loop)
      - [low](#low)
      - [max](#max)
      - [maxlength](#maxlength)
      - [media](#media)
      - [method](#method)
      - [min](#min)
      - [minlength](#minlength)
      - [multiple](#multiple)
      - [muted](#muted)
      - [name](#name)
      - [nonce](#nonce)
      - [novalidate](#novalidate)
      - [open](#open)
      - [optimum](#optimum)
      - [pattern](#pattern)
      - [ping](#ping)
      - [placeholder](#placeholder)
      - [playsinline](#playsinline)
      - [popover](#popover)
      - [popovertarget](#popovertarget)
      - [popovertargetaction](#popovertargetaction)
      - [poster](#poster)
      - [preload](#preload)
      - [readonly](#readonly)
      - [referrerpolicy](#referrerpolicy)
      - [rel](#rel)
      - [required](#required)
      - [reversed](#reversed)
      - [rows](#rows)
      - [rowspan](#rowspan)
      - [sandbox](#sandbox)
      - [scope](#scope)
      - [selected](#selected)
      - [shadowrootclonable](#shadowrootclonable)
      - [shadowrootdelegatesfocus](#shadowrootdelegatesfocus)
      - [shadowrootmode](#shadowrootmode)
      - [shadowrootserializable](#shadowrootserializable)
      - [shape](#shape)
      - [size](#size)
      - [sizes](#sizes)
      - [slot](#slot)
      - [span](#span)
      - [spellcheck](#spellcheck)
      - [src](#src)
      - [srcdoc](#srcdoc)
      - [srclang](#srclang)
      - [srcset](#srcset)
      - [start](#start)
      - [step](#step)
      - [style](#style)
      - [tabindex](#tabindex)
      - [target](#target)
      - [title](#title)
      - [translate](#translate)
      - [type\_](#type_)
      - [usemap](#usemap)
      - [value](#value)
      - [width](#width)
      - [wrap](#wrap)
      - [writingsuggestions](#writingsuggestions)

> **_NOTE:_** The `async`, `defer`, and `nomodule` attributes are omitted in this package as they are only supported by the `script` element which has also been omitted due to incompatibility with Elm.


# Documentation


## Types

@docs Attribute


## Contextualization

@docs contextualize, decontextualize, using


## Attributes

@docs abbr, accept, acceptCharset, accesskey, action, allow, allowfullscreen, alt, as_, autocapitalize, autocomplete, autofocus, autoplay, blocking, charset, checked, cite, class, color, cols, colspan, content, contenteditable, controls, coords, crossorigin, data, datetime, decoding, default, dir, dirname, disabled, download, draggable, enctype, enterkeyhint, fetchpriority, for, form, formaction, formenctype, formmethod, formnovalidate, formtarget, headers, height, hidden, high, href, hreflang, httpEquiv, id, imagesizes, imagesrcset, inert, inputmode, integrity, is, ismap, itemid, itemprop, itemref, itemscope, itemtype, kind, label, lang, list, loading, loop, low, max, maxlength, media, method, min, minlength, multiple, muted, name, nonce, novalidate, open, optimum, pattern, ping, placeholder, playsinline, popover, popovertarget, popovertargetaction, poster, preload, readonly, referrerpolicy, rel, required, reversed, rows, rowspan, sandbox, scope, selected, shadowrootclonable, shadowrootdelegatesfocus, shadowrootmode, shadowrootserializable, shape, size, sizes, slot, span, spellcheck, src, srcdoc, srclang, srcset, start, step, style, tabindex, target, title, translate, type_, usemap, value, width, wrap, writingsuggestions

-}

import Json.Encode as Json
import VirtualDom



-- TYPES


{-| Represents an HTML attribute encompassing a context (`ctx`) and message (`msg`), also known as a contextualized HTML attribute.
-}
type Attribute ctx msg
    = Attribute (ctx -> VirtualDom.Attribute msg)



-- CONTEXTUALIZATION


{-| Converts a decontextualized virtual DOM attribute into a contextualized HTML attribute.
-}
contextualize : VirtualDom.Attribute msg -> Attribute ctx msg
contextualize decontextualizedAttribute =
    Attribute (\_ -> decontextualizedAttribute)


{-| Converts a contextualized HTML attribute into a decontextualized virtual DOM attribute.
-}
decontextualize : ctx -> Attribute ctx msg -> VirtualDom.Attribute msg
decontextualize context (Attribute apply) =
    apply context


{-| Establishes a dependency between a context and an HTML attribute.
-}
using : (ctx -> Attribute ctx msg) -> Attribute ctx msg
using apply =
    Attribute (\context -> decontextualize context <| apply context)



-- ATTRIBUTES


{-| Constructs a contextualized HTML `abbr` attribute.
-}
abbr : String -> Attribute ctx msg
abbr val =
    property "abbr" (Json.string val)


{-| Constructs a contextualized HTML `accept` attribute.
-}
accept : String -> Attribute ctx msg
accept val =
    property "accept" (Json.string val)


{-| Constructs a contextualized HTML `accept-charset` attribute.
-}
acceptCharset : String -> Attribute ctx msg
acceptCharset val =
    property "acceptCharset" (Json.string val)


{-| Constructs a contextualized HTML `accesskey` attribute.
-}
accesskey : String -> Attribute ctx msg
accesskey val =
    property "accessKey" (Json.string val)


{-| Constructs a contextualized HTML `action` attribute.
-}
action : String -> Attribute ctx msg
action val =
    property "action" (Json.string val)


{-| Constructs a contextualized HTML `allow` attribute.
-}
allow : String -> Attribute ctx msg
allow val =
    property "allow" (Json.string val)


{-| Constructs a contextualized HTML `allowfullscreen` attribute.
-}
allowfullscreen : Bool -> Attribute ctx msg
allowfullscreen val =
    property "allowFullscreen" (Json.bool val)


{-| Constructs a contextualized HTML `alt` attribute.
-}
alt : String -> Attribute ctx msg
alt val =
    property "alt" (Json.string val)


{-| Constructs a contextualized HTML `as` attribute.
-}
as_ : String -> Attribute ctx msg
as_ val =
    property "as" (Json.string val)


{-| Constructs a contextualized HTML `autocapitalize` attribute.
-}
autocapitalize : String -> Attribute ctx msg
autocapitalize val =
    property "autocapitalize" (Json.string val)


{-| Constructs a contextualized HTML `autocomplete` attribute.

Supported lements: `form`, `input`, `select`, `textarea`

-}
autocomplete : String -> Attribute ctx msg
autocomplete val =
    property "autocomplete" (Json.string val)


{-| Constructs a contextualized HTML `autofocus` attribute.
-}
autofocus : Bool -> Attribute ctx msg
autofocus val =
    property "autofocus" (Json.bool val)


{-| Constructs a contextualized HTML `autoplay` attribute.
-}
autoplay : Bool -> Attribute ctx msg
autoplay val =
    property "autoplay" (Json.bool val)


{-| Constructs a contextualized HTML `blocking` attribute.
-}
blocking : String -> Attribute ctx msg
blocking val =
    property "blocking" (Json.string val)


{-| Constructs a contextualized HTML `charset` attribute.
-}
charset : String -> Attribute ctx msg
charset val =
    property "charset" (Json.string val)


{-| Constructs a contextualized HTML `checked` attribute.
-}
checked : Bool -> Attribute ctx msg
checked val =
    property "checked" (Json.bool val)


{-| Constructs a contextualized HTML `cite` attribute.
-}
cite : String -> Attribute ctx msg
cite val =
    property "cite" (Json.string val)


{-| Constructs a contextualized HTML `class` attribute.
-}
class : String -> Attribute ctx msg
class val =
    property "className" (Json.string val)


{-| Constructs a contextualized HTML `color` attribute.
-}
color : String -> Attribute ctx msg
color val =
    attribute "color" val


{-| Constructs a contextualized HTML `cols` attribute.
-}
cols : Int -> Attribute ctx msg
cols val =
    property "cols" (Json.int val)


{-| Constructs a contextualized HTML `colspan` attribute.
-}
colspan : Int -> Attribute ctx msg
colspan val =
    property "colSpan" (Json.int val)


{-| Constructs a contextualized HTML `content` attribute.
-}
content : String -> Attribute ctx msg
content val =
    property "content" (Json.string val)


{-| Constructs a contextualized HTML `contenteditable` attribute.
-}
contenteditable : String -> Attribute ctx msg
contenteditable val =
    property "contentEditable" (Json.string val)


{-| Constructs a contextualized HTML `controls` attribute.
-}
controls : Bool -> Attribute ctx msg
controls val =
    property "controls" (Json.bool val)


{-| Constructs a contextualized HTML `coords` attribute.
-}
coords : String -> Attribute ctx msg
coords val =
    property "coords" (Json.string val)


{-| Constructs a contextualized HTML `crossorigin` attribute.
-}
crossorigin : String -> Attribute ctx msg
crossorigin val =
    property "crossOrigin" (Json.string val)


{-| Constructs a contextualized HTML `data` attribute.
-}
data : String -> Attribute ctx msg
data val =
    property "data" (Json.string val)


{-| Constructs a contextualized HTML `datetime` attribute.
-}
datetime : String -> Attribute ctx msg
datetime val =
    property "dateTime" (Json.string val)


{-| Constructs a contextualized HTML `decoding` attribute.
-}
decoding : String -> Attribute ctx msg
decoding val =
    property "decoding" (Json.string val)


{-| Constructs a contextualized HTML `default` attribute.
-}
default : Bool -> Attribute ctx msg
default val =
    property "default" (Json.bool val)


{-| Constructs a contextualized HTML `dir` attribute.
-}
dir : String -> Attribute ctx msg
dir val =
    property "dir" (Json.string val)


{-| Constructs a contextualized HTML `dirname` attribute.
-}
dirname : String -> Attribute ctx msg
dirname val =
    property "dirName" (Json.string val)


{-| Constructs a contextualized HTML `disabled` attribute.
-}
disabled : Bool -> Attribute ctx msg
disabled val =
    property "disabled" (Json.bool val)


{-| Constructs a contextualized HTML `download` attribute.
-}
download : String -> Attribute ctx msg
download val =
    property "download" (Json.string val)


{-| Constructs a contextualized HTML `draggable` attribute.
-}
draggable : Bool -> Attribute ctx msg
draggable val =
    property "draggable" (Json.bool val)


{-| Constructs a contextualized HTML `enctype` attribute.
-}
enctype : String -> Attribute ctx msg
enctype val =
    property "enctype" (Json.string val)


{-| Constructs a contextualized HTML `enterkeyhint` attribute.
-}
enterkeyhint : String -> Attribute ctx msg
enterkeyhint val =
    property "enterKeyHint" (Json.string val)


{-| Constructs a contextualized HTML `fetchpriority` attribute.
-}
fetchpriority : String -> Attribute ctx msg
fetchpriority val =
    property "fetchPriority" (Json.string val)


{-| Constructs a contextualized HTML `for` attribute.
-}
for : String -> Attribute ctx msg
for val =
    property "htmlFor" (Json.string val)


{-| Constructs a contextualized HTML `form` attribute.
-}
form : String -> Attribute ctx msg
form val =
    attribute "form" val


{-| Constructs a contextualized HTML `formaction` attribute.
-}
formaction : String -> Attribute ctx msg
formaction val =
    property "formAction" (Json.string val)


{-| Constructs a contextualized HTML `formenctype` attribute.
-}
formenctype : String -> Attribute ctx msg
formenctype val =
    property "formEnctype" (Json.string val)


{-| Constructs a contextualized HTML `formmethod` attribute.
-}
formmethod : String -> Attribute ctx msg
formmethod val =
    property "formMethod" (Json.string val)


{-| Constructs a contextualized HTML `formnovalidate` attribute.
-}
formnovalidate : Bool -> Attribute ctx msg
formnovalidate val =
    property "formNoValidate" (Json.bool val)


{-| Constructs a contextualized HTML `formtarget` attribute.
-}
formtarget : String -> Attribute ctx msg
formtarget val =
    property "formTarget" (Json.string val)


{-| Constructs a contextualized HTML `headers` attribute.
-}
headers : String -> Attribute ctx msg
headers val =
    property "headers" (Json.string val)


{-| Constructs a contextualized HTML `height` attribute.
-}
height : Int -> Attribute ctx msg
height val =
    property "height" (Json.int val)


{-| Constructs a contextualized HTML `hidden` attribute.
-}
hidden : String -> Attribute ctx msg
hidden val =
    property "hidden" (Json.string val)


{-| Constructs a contextualized HTML `high` attribute.
-}
high : Float -> Attribute ctx msg
high val =
    property "high" (Json.float val)


{-| Constructs a contextualized HTML `href` attribute.
-}
href : String -> Attribute ctx msg
href val =
    property "href" (Json.string val)


{-| Constructs a contextualized HTML `hreflang` attribute.
-}
hreflang : String -> Attribute ctx msg
hreflang val =
    property "hreflang" (Json.string val)


{-| Constructs a contextualized HTML `http-equiv` attribute.
-}
httpEquiv : String -> Attribute ctx msg
httpEquiv val =
    property "httpEquiv" (Json.string val)


{-| Constructs a contextualized HTML `id` attribute.
-}
id : String -> Attribute ctx msg
id val =
    property "id" (Json.string val)


{-| Constructs a contextualized HTML `imagesizes` attribute.
-}
imagesizes : String -> Attribute ctx msg
imagesizes val =
    property "imageSizes" (Json.string val)


{-| Constructs a contextualized HTML `imagesrcset` attribute.
-}
imagesrcset : String -> Attribute ctx msg
imagesrcset val =
    property "imageSrcset" (Json.string val)


{-| Constructs a contextualized HTML `inert` attribute.
-}
inert : Bool -> Attribute ctx msg
inert val =
    property "inert" (Json.bool val)


{-| Constructs a contextualized HTML `inputmode` attribute.
-}
inputmode : String -> Attribute ctx msg
inputmode val =
    property "inputMode" (Json.string val)


{-| Constructs a contextualized HTML `integrity` attribute.
-}
integrity : String -> Attribute ctx msg
integrity val =
    property "integrity" (Json.string val)


{-| Constructs a contextualized HTML `is` attribute.
-}
is : String -> Attribute ctx msg
is val =
    attribute "is" val


{-| Constructs a contextualized HTML `ismap` attribute.
-}
ismap : Bool -> Attribute ctx msg
ismap val =
    property "isMap" (Json.bool val)


{-| Constructs a contextualized HTML `itemid` attribute.
-}
itemid : String -> Attribute ctx msg
itemid val =
    attribute "itemid" val


{-| Constructs a contextualized HTML `itemprop` attribute.
-}
itemprop : String -> Attribute ctx msg
itemprop val =
    attribute "itemprop" val


{-| Constructs a contextualized HTML `itemref` attribute.
-}
itemref : String -> Attribute ctx msg
itemref val =
    attribute "itemref" val


{-| Constructs a contextualized HTML `itemscope` attribute.
-}
itemscope : String -> Attribute ctx msg
itemscope val =
    attribute "itemscope" val


{-| Constructs a contextualized HTML `itemtype` attribute.
-}
itemtype : String -> Attribute ctx msg
itemtype val =
    attribute "itemtype" val


{-| Constructs a contextualized HTML `kind` attribute.
-}
kind : String -> Attribute ctx msg
kind val =
    property "kind" (Json.string val)


{-| Constructs a contextualized HTML `label` attribute.
-}
label : String -> Attribute ctx msg
label val =
    property "label" (Json.string val)


{-| Constructs a contextualized HTML `lang` attribute.
-}
lang : String -> Attribute ctx msg
lang val =
    property "lang" (Json.string val)


{-| Constructs a contextualized HTML `list` attribute.
-}
list : String -> Attribute ctx msg
list val =
    attribute "list" val


{-| Constructs a contextualized HTML `loading` attribute.
-}
loading : String -> Attribute ctx msg
loading val =
    property "loading" (Json.string val)


{-| Constructs a contextualized HTML `loop` attribute.
-}
loop : Bool -> Attribute ctx msg
loop val =
    property "loop" (Json.bool val)


{-| Constructs a contextualized HTML `low` attribute.
-}
low : Float -> Attribute ctx msg
low val =
    property "low" (Json.float val)


{-| Constructs a contextualized HTML `max` attribute.
-}
max : String -> Attribute ctx msg
max val =
    property "max" (Json.string val)


{-| Constructs a contextualized HTML `maxlength` attribute.
-}
maxlength : Int -> Attribute ctx msg
maxlength val =
    property "maxLength" (Json.int val)


{-| Constructs a contextualized HTML `media` attribute.
-}
media : String -> Attribute ctx msg
media val =
    property "media" (Json.string val)


{-| Constructs a contextualized HTML `method` attribute.
-}
method : String -> Attribute ctx msg
method val =
    property "method" (Json.string val)


{-| Constructs a contextualized HTML `min` attribute.
-}
min : String -> Attribute ctx msg
min val =
    property "min" (Json.string val)


{-| Constructs a contextualized HTML `minlength` attribute.
-}
minlength : Int -> Attribute ctx msg
minlength val =
    property "minLength" (Json.int val)


{-| Constructs a contextualized HTML `multiple` attribute.
-}
multiple : Bool -> Attribute ctx msg
multiple val =
    property "multiple" (Json.bool val)


{-| Constructs a contextualized HTML `muted` attribute.
-}
muted : Bool -> Attribute ctx msg
muted val =
    property "muted" (Json.bool val)


{-| Constructs a contextualized HTML `name` attribute.
-}
name : String -> Attribute ctx msg
name val =
    property "name" (Json.string val)


{-| Constructs a contextualized HTML `nonce` attribute.
-}
nonce : String -> Attribute ctx msg
nonce val =
    property "nonce" (Json.string val)


{-| Constructs a contextualized HTML `novalidate` attribute.
-}
novalidate : Bool -> Attribute ctx msg
novalidate val =
    property "noValidate" (Json.bool val)


{-| Constructs a contextualized HTML `open` attribute.
-}
open : Bool -> Attribute ctx msg
open val =
    property "open" (Json.bool val)


{-| Constructs a contextualized HTML `optimum` attribute.
-}
optimum : Float -> Attribute ctx msg
optimum val =
    property "optimum" (Json.float val)


{-| Constructs a contextualized HTML `pattern` attribute.
-}
pattern : String -> Attribute ctx msg
pattern val =
    property "pattern" (Json.string val)


{-| Constructs a contextualized HTML `ping` attribute.
-}
ping : String -> Attribute ctx msg
ping val =
    property "ping" (Json.string val)


{-| Constructs a contextualized HTML `placeholder` attribute.
-}
placeholder : String -> Attribute ctx msg
placeholder val =
    property "placeholder" (Json.string val)


{-| Constructs a contextualized HTML `playsinline` attribute.
-}
playsinline : Bool -> Attribute ctx msg
playsinline val =
    property "playsInline" (Json.bool val)


{-| Constructs a contextualized HTML `popover` attribute.
-}
popover : String -> Attribute ctx msg
popover val =
    property "popover" (Json.string val)


{-| Constructs a contextualized HTML `popovertarget` attribute.
-}
popovertarget : String -> Attribute ctx msg
popovertarget val =
    property "popoverTarget" (Json.string val)


{-| Constructs a contextualized HTML `popovertargetaction` attribute.
-}
popovertargetaction : String -> Attribute ctx msg
popovertargetaction val =
    property "popoverTargetAction" (Json.string val)


{-| Constructs a contextualized HTML `poster` attribute.
-}
poster : String -> Attribute ctx msg
poster val =
    property "poster" (Json.string val)


{-| Constructs a contextualized HTML `preload` attribute.
-}
preload : String -> Attribute ctx msg
preload val =
    property "preload" (Json.string val)


{-| Constructs a contextualized HTML `readonly` attribute.
-}
readonly : Bool -> Attribute ctx msg
readonly val =
    property "readOnly" (Json.bool val)


{-| Constructs a contextualized HTML `referrerpolicy` attribute.
-}
referrerpolicy : String -> Attribute ctx msg
referrerpolicy val =
    property "referrerPolicy" (Json.string val)


{-| Constructs a contextualized HTML `rel` attribute.
-}
rel : String -> Attribute ctx msg
rel val =
    property "rel" (Json.string val)


{-| Constructs a contextualized HTML `required` attribute.
-}
required : Bool -> Attribute ctx msg
required val =
    property "required" (Json.bool val)


{-| Constructs a contextualized HTML `reversed` attribute.
-}
reversed : Bool -> Attribute ctx msg
reversed val =
    property "reversed" (Json.bool val)


{-| Constructs a contextualized HTML `rows` attribute.
-}
rows : Int -> Attribute ctx msg
rows val =
    property "rows" (Json.int val)


{-| Constructs a contextualized HTML `rowspan` attribute.
-}
rowspan : Int -> Attribute ctx msg
rowspan val =
    property "rowSpan" (Json.int val)


{-| Constructs a contextualized HTML `sandbox` attribute.
-}
sandbox : String -> Attribute ctx msg
sandbox val =
    property "sandbox" (Json.string val)


{-| Constructs a contextualized HTML `scope` attribute.
-}
scope : String -> Attribute ctx msg
scope val =
    property "scope" (Json.string val)


{-| Constructs a contextualized HTML `selected` attribute.
-}
selected : Bool -> Attribute ctx msg
selected val =
    property "selected" (Json.bool val)


{-| Constructs a contextualized HTML `shadowrootclonable` attribute.
-}
shadowrootclonable : Bool -> Attribute ctx msg
shadowrootclonable val =
    property "shadowRootClonable" (Json.bool val)


{-| Constructs a contextualized HTML `shadowrootdelegatesfocus` attribute.
-}
shadowrootdelegatesfocus : Bool -> Attribute ctx msg
shadowrootdelegatesfocus val =
    property "shadowRootDelegatesFocus" (Json.bool val)


{-| Constructs a contextualized HTML `shadowrootmode` attribute.
-}
shadowrootmode : String -> Attribute ctx msg
shadowrootmode val =
    property "shadowRootMode" (Json.string val)


{-| Constructs a contextualized HTML `shadowrootserializable` attribute.
-}
shadowrootserializable : Bool -> Attribute ctx msg
shadowrootserializable val =
    property "shadowRootSerializable" (Json.bool val)


{-| Constructs a contextualized HTML `shape` attribute.
-}
shape : String -> Attribute ctx msg
shape val =
    property "shape" (Json.string val)


{-| Constructs a contextualized HTML `size` attribute.
-}
size : Int -> Attribute ctx msg
size val =
    property "size" (Json.int val)


{-| Constructs a contextualized HTML `sizes` attribute.
-}
sizes : String -> Attribute ctx msg
sizes val =
    property "sizes" (Json.string val)


{-| Constructs a contextualized HTML `slot` attribute.
-}
slot : String -> Attribute ctx msg
slot val =
    property "slot" (Json.string val)


{-| Constructs a contextualized HTML `span` attribute.
-}
span : Int -> Attribute ctx msg
span val =
    property "span" (Json.int val)


{-| Constructs a contextualized HTML `spellcheck` attribute.
-}
spellcheck : Bool -> Attribute ctx msg
spellcheck val =
    property "spellcheck" (Json.bool val)


{-| Constructs a contextualized HTML `src` attribute.
-}
src : String -> Attribute ctx msg
src val =
    property "src" (Json.string val)


{-| Constructs a contextualized HTML `srcdoc` attribute.
-}
srcdoc : String -> Attribute ctx msg
srcdoc val =
    property "srcdoc" (Json.string val)


{-| Constructs a contextualized HTML `srclang` attribute.
-}
srclang : String -> Attribute ctx msg
srclang val =
    property "srclang" (Json.string val)


{-| Constructs a contextualized HTML `srcset` attribute.
-}
srcset : String -> Attribute ctx msg
srcset val =
    property "srcset" (Json.string val)


{-| Constructs a contextualized HTML `start` attribute.
-}
start : Int -> Attribute ctx msg
start val =
    property "start" (Json.int val)


{-| Constructs a contextualized HTML `step` attribute.
-}
step : String -> Attribute ctx msg
step val =
    property "step" (Json.string val)


{-| Constructs a contextualized HTML `style` attribute.
-}
style : String -> Attribute ctx msg
style val =
    property "style" (Json.string val)


{-| Constructs a contextualized HTML `tabindex` attribute.
-}
tabindex : Int -> Attribute ctx msg
tabindex val =
    property "tabIndex" (Json.int val)


{-| Constructs a contextualized HTML `target` attribute.
-}
target : String -> Attribute ctx msg
target val =
    property "target" (Json.string val)


{-| Constructs a contextualized HTML `title` attribute.
-}
title : String -> Attribute ctx msg
title val =
    property "title" (Json.string val)


{-| Constructs a contextualized HTML `translate` attribute.
-}
translate : Bool -> Attribute ctx msg
translate val =
    property "translate" (Json.bool val)


{-| Constructs a contextualized HTML `type` attribute.
-}
type_ : String -> Attribute ctx msg
type_ val =
    property "type" (Json.string val)


{-| Constructs a contextualized HTML `usemap` attribute.
-}
usemap : String -> Attribute ctx msg
usemap val =
    property "useMap" (Json.string val)


{-| Constructs a contextualized HTML `value` attribute.
-}
value : String -> Attribute ctx msg
value val =
    property "value" (Json.string val)


{-| Constructs a contextualized HTML `width` attribute.
-}
width : Int -> Attribute ctx msg
width val =
    property "width" (Json.int val)


{-| Constructs a contextualized HTML `wrap` attribute.
-}
wrap : String -> Attribute ctx msg
wrap val =
    property "wrap" (Json.string val)


{-| Constructs a contextualized HTML `writingsuggestions` attribute.
-}
writingsuggestions : Bool -> Attribute ctx msg
writingsuggestions val =
    property "writingSuggestions" (Json.bool val)



-- PRIVATE


attribute : String -> String -> Attribute ctx msg
attribute key val =
    Attribute (\_ -> VirtualDom.attribute key val)


property : String -> Json.Value -> Attribute ctx msg
property key val =
    Attribute (\_ -> VirtualDom.property key val)
