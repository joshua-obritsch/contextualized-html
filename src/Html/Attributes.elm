module Html.Attributes exposing
    ( contextualize, decontextualize
    , using
    , mapAttribute
    , property, boolProperty, floatProperty, intProperty, stringProperty
    , attribute
    , abbr, accept, acceptCharset, accesskey, action, allow, allowfullscreen, alt, as_, autocapitalize, autocomplete, autofocus, autoplay, blocking, charset, checked, cite, class, color, cols, colspan, content, contenteditable, controls, coords, crossorigin, data, datetime, decoding, default, dir, dirname, disabled, download, draggable, enctype, enterkeyhint, fetchpriority, for, form, formaction, formenctype, formmethod, formnovalidate, formtarget, headers, height, hidden, high, href, hreflang, httpEquiv, id, imagesizes, imagesrcset, inert, inputmode, integrity, is, ismap, itemid, itemprop, itemref, itemscope, itemtype, kind, label, lang, list, loading, loop, low, max, maxlength, media, method, min, minlength, multiple, muted, name, nonce, novalidate, open, optimum, pattern, ping, placeholder, playsinline, popover, popovertarget, popovertargetaction, poster, preload, readonly, referrerpolicy, rel, required, reversed, rows, rowspan, sandbox, scope, selected, shadowrootclonable, shadowrootdelegatesfocus, shadowrootmode, shadowrootserializable, shape, size, sizes, slot, span, spellcheck, src, srcdoc, srclang, srcset, start, step, style, style2, tabindex, target, title, translate, type_, usemap, value, width, wrap, writingsuggestions
    )

{-| This module provides a set of types and functions for generating context-dependent HTML attributes.

Removed: `async`, `nomodule`


# Contextual Conversion

@docs contextualize, decontextualize


# Contextual Dependency

@docs using


# Transformations

@docs mapAttribute


# Custom Properties

@docs property, boolProperty, floatProperty, intProperty, stringProperty


# Custom Attributes

@docs attribute


# Standard Attributes

@docs abbr, accept, acceptCharset, accesskey, action, allow, allowfullscreen, alt, as_, autocapitalize, autocomplete, autofocus, autoplay, blocking, charset, checked, cite, class, color, cols, colspan, content, contenteditable, controls, coords, crossorigin, data, datetime, decoding, default, dir, dirname, disabled, download, draggable, enctype, enterkeyhint, fetchpriority, for, form, formaction, formenctype, formmethod, formnovalidate, formtarget, headers, height, hidden, high, href, hreflang, httpEquiv, id, imagesizes, imagesrcset, inert, inputmode, integrity, is, ismap, itemid, itemprop, itemref, itemscope, itemtype, kind, label, lang, list, loading, loop, low, max, maxlength, media, method, min, minlength, multiple, muted, name, nonce, novalidate, open, optimum, pattern, ping, placeholder, playsinline, popover, popovertarget, popovertargetaction, poster, preload, readonly, referrerpolicy, rel, required, reversed, rows, rowspan, sandbox, scope, selected, shadowrootclonable, shadowrootdelegatesfocus, shadowrootmode, shadowrootserializable, shape, size, sizes, slot, span, spellcheck, src, srcdoc, srclang, srcset, start, step, style, style2, tabindex, target, title, translate, type_, usemap, value, width, wrap, writingsuggestions

-}

import Html exposing (Attribute)
import Html.Internal as Internal
import Json.Encode as Json
import VirtualDom



-- CONTEXTUAL CONVERSION


{-| Converts a decontextualized virtual DOM attribute into a contextualized HTML attribute.
-}
contextualize : VirtualDom.Attribute msg -> Attribute ctx msg
contextualize =
    Internal.contextualizeAttribute


{-| Converts a contextualized HTML attribute into a decontextualized virtual DOM attribute.
-}
decontextualize : ctx -> Attribute ctx msg -> VirtualDom.Attribute msg
decontextualize =
    Internal.decontextualizeAttribute



-- CONTEXTUAL DEPENDENCY


{-| Establishes a dependency between a context and an HTML attribute.
-}
using : (ctx -> Attribute ctx msg) -> Attribute ctx msg
using =
    Internal.usingAttribute



-- TRANSFORMATIONS


{-| Transforms the message of a contextualized HTML attribute.
-}
mapAttribute : (a -> b) -> Attribute ctx a -> Attribute ctx b
mapAttribute =
    Internal.mapAttribute



-- CUSTOM PROPERTIES


{-| Constructs a contextualized HTML property.
-}
property : String -> Json.Value -> Attribute ctx msg
property =
    Internal.property


{-| Constructs a contextualized HTML property of type `Bool`.
-}
boolProperty : String -> Bool -> Attribute ctx msg
boolProperty =
    Internal.boolProperty


{-| Constructs a contextualized HTML property of type `Char`.
-}
charProperty : String -> Char -> Attribute ctx msg
charProperty =
    Internal.charProperty


{-| Constructs a contextualized HTML property of type `Float`.
-}
floatProperty : String -> Float -> Attribute ctx msg
floatProperty =
    Internal.floatProperty


{-| Constructs a contextualized HTML property of type `Int`.
-}
intProperty : String -> Int -> Attribute ctx msg
intProperty =
    Internal.intProperty


{-| Constructs a contextualized HTML property of type `String`.
-}
stringProperty : String -> String -> Attribute ctx msg
stringProperty =
    Internal.stringProperty



-- CUSTOM ATTRIBUTES


{-| Constructs a contextualized HTML attribute.
-}
attribute : String -> String -> Attribute ctx msg
attribute =
    Internal.attribute



-- STANDARD ATTRIBUTES


{-| Constructs a contextualized HTML `abbr` attribute.

Supported elements: `th`

-}
abbr : String -> Attribute ctx msg
abbr =
    stringProperty "abbr"


{-| Constructs a contextualized HTML `accept` attribute.

Supported elements: `input`

-}
accept : String -> Attribute ctx msg
accept =
    stringProperty "accept"


{-| Constructs a contextualized HTML `accept-charset` attribute.

Supported elements: `form`

-}
acceptCharset : String -> Attribute ctx msg
acceptCharset =
    stringProperty "acceptCharset"


{-| Constructs a contextualized HTML `accesskey` attribute.

Supported elements: _HTML elements_

-}
accesskey : Char -> Attribute ctx msg
accesskey =
    charProperty "accessKey"


{-| Constructs a contextualized HTML `action` attribute.

Supported elements: `form`

-}
action : String -> Attribute ctx msg
action =
    stringProperty "action"


{-| Constructs a contextualized HTML `allow` attribute.

Supported elements: `iframe`

-}
allow : String -> Attribute ctx msg
allow =
    stringProperty "allow"


{-| Constructs a contextualized HTML `allowfullscreen` attribute.

Supported elements: `iframe`

-}
allowfullscreen : Bool -> Attribute ctx msg
allowfullscreen =
    boolProperty "allowFullscreen"


{-| Constructs a contextualized HTML `alt` attribute.

Supported elements: `area`, `img`, `input`

-}
alt : String -> Attribute ctx msg
alt =
    stringProperty "alt"


{-| Constructs a contextualized HTML `as` attribute.

Supported elements: `link`

-}
as_ : String -> Attribute ctx msg
as_ =
    stringProperty "as"


{-| Constructs a contextualized HTML `autocapitalize` attribute.

Supported elements: _HTML elements_

-}
autocapitalize : String -> Attribute ctx msg
autocapitalize =
    stringProperty "autocapitalize"


{-| Constructs a contextualized HTML `autocomplete` attribute.

Supported lements: `form`, `input`, `select`, `textarea`

-}
autocomplete : String -> Attribute ctx msg
autocomplete =
    stringProperty "autocomplete"


{-| Constructs a contextualized HTML `autofocus` attribute.

Supported elements: _HTML elements_

-}
autofocus : Bool -> Attribute ctx msg
autofocus =
    boolProperty "autofocus"


{-| Constructs a contextualized HTML `autoplay` attribute.

Supported elements: `audio`, `video`

-}
autoplay : Bool -> Attribute ctx msg
autoplay =
    boolProperty "autoplay"


{-| Constructs a contextualized HTML `blocking` attribute.

Supported elements: `link`, `script`, `style`

> **_NOTE:_** The HTML `script` element is omitted in this package due to incompatibility with Elm.

-}
blocking : String -> Attribute ctx msg
blocking =
    stringProperty "blocking"


{-| Constructs a contextualized HTML `charset` attribute.

Supported elements: `meta`

-}
charset : String -> Attribute ctx msg
charset =
    stringProperty "charset"


{-| Constructs a contextualized HTML `checked` attribute.

Supported elements: `input`

-}
checked : Bool -> Attribute ctx msg
checked =
    boolProperty "checked"


{-| Constructs a contextualized HTML `cite` attribute.

Supported elements: `blockquote`, `del`, `ins`, `q`

-}
cite : String -> Attribute ctx msg
cite =
    stringProperty "cite"


{-| Constructs a contextualized HTML `class` attribute.

Supported elements: _HTML elements_

-}
class : String -> Attribute ctx msg
class =
    stringProperty "className"


{-| Constructs a contextualized HTML `color` attribute.

Supported elements: `link`

-}
color : String -> Attribute ctx msg
color =
    attribute "color"


{-| Constructs a contextualized HTML `cols` attribute.

Supported elements: `textarea`

-}
cols : Int -> Attribute ctx msg
cols =
    intProperty "cols"


{-| Constructs a contextualized HTML `colspan` attribute.

Supported elements: `td`, `th`

-}
colspan : Int -> Attribute ctx msg
colspan =
    intProperty "colSpan"


{-| Constructs a contextualized HTML `content` attribute.

Supported elements: `meta`

-}
content : String -> Attribute ctx msg
content =
    stringProperty "content"


{-| Constructs a contextualized HTML `contenteditable` attribute.

Supported elements: _HTML elements_

-}
contenteditable : String -> Attribute ctx msg
contenteditable =
    stringProperty "contentEditable"


{-| Constructs a contextualized HTML `controls` attribute.

Supported elements: `audio`, `video`

-}
controls : Bool -> Attribute ctx msg
controls =
    boolProperty "controls"


{-| Constructs a contextualized HTML `coords` attribute.

Supported elements: `area`

-}
coords : String -> Attribute ctx msg
coords =
    stringProperty "coords"


{-| Constructs a contextualized HTML `crossorigin` attribute.

Supported elements: `audio`, `img`, `link`, `script`, `video`

> **_NOTE:_** The HTML `script` element is omitted in this package due to incompatibility with Elm.

-}
crossorigin : String -> Attribute ctx msg
crossorigin =
    stringProperty "crossOrigin"


{-| Constructs a contextualized HTML `data` attribute.

Supported elements: `object`

-}
data : String -> Attribute ctx msg
data =
    stringProperty "data"


{-| Constructs a contextualized HTML `datetime` attribute.

Supported elements: `del`, `ins`, `time`

-}
datetime : String -> Attribute ctx msg
datetime =
    stringProperty "dateTime"


{-| Constructs a contextualized HTML `decoding` attribute.

Supported elements: `img`

-}
decoding : String -> Attribute ctx msg
decoding =
    stringProperty "decoding"


{-| Constructs a contextualized HTML `default` attribute.

Supported elements: `track`

-}
default : Bool -> Attribute ctx msg
default =
    boolProperty "default"


{-| Constructs a contextualized HTML `dir` attribute.

Supported elements: _HTML elements_

-}
dir : String -> Attribute ctx msg
dir =
    stringProperty "dir"


{-| Constructs a contextualized HTML `dirname` attribute.

Supported elements: `input`, `textarea`

-}
dirname : String -> Attribute ctx msg
dirname =
    stringProperty "dirName"


{-| Constructs a contextualized HTML `disabled` attribute.

Supported elements: `button`, `fieldset`, `input`, `link`, `optgroup`, `option`, `select`, `textarea`, _form-associated custom elements_

-}
disabled : Bool -> Attribute ctx msg
disabled =
    boolProperty "disabled"


{-| Constructs a contextualized HTML `download` attribute.

Supported elements: `a`, `area`

-}
download : String -> Attribute ctx msg
download =
    stringProperty "download"


{-| Constructs a contextualized HTML `draggable` attribute.

Supported elements: _HTML elements_

-}
draggable : Bool -> Attribute ctx msg
draggable =
    boolProperty "draggable"


{-| Constructs a contextualized HTML `enctype` attribute.

Supported elements: `form`

-}
enctype : String -> Attribute ctx msg
enctype =
    stringProperty "enctype"


{-| Constructs a contextualized HTML `enterkeyhint` attribute.

Supported elements: _HTML elements_

-}
enterkeyhint : String -> Attribute ctx msg
enterkeyhint =
    stringProperty "enterKeyHint"


{-| Constructs a contextualized HTML `fetchpriority` attribute.

Supported elements: `img`, `link`, `script`

> **_NOTE:_** The HTML `script` element is omitted in this package due to incompatibility with Elm.

-}
fetchpriority : String -> Attribute ctx msg
fetchpriority =
    stringProperty "fetchPriority"


{-| Constructs a contextualized HTML `for` attribute.

Supported elements: `label`, `output`

-}
for : String -> Attribute ctx msg
for =
    stringProperty "htmlFor"


{-| Constructs a contextualized HTML `form` attribute.

Supported elements: `button`, `fieldset`, `input`, `object`, `output`, `select`, `textarea`, _form-associated custom elements_

-}
form : String -> Attribute ctx msg
form =
    attribute "form"


{-| Constructs a contextualized HTML `formaction` attribute.

Supported elements: `button`, `input`

-}
formaction : String -> Attribute ctx msg
formaction =
    stringProperty "formAction"


{-| Constructs a contextualized HTML `formenctype` attribute.

Supported elements: `button`, `input`

-}
formenctype : String -> Attribute ctx msg
formenctype =
    stringProperty "formEnctype"


{-| Constructs a contextualized HTML `formmethod` attribute.

Supported elements: `button`, `input`

-}
formmethod : String -> Attribute ctx msg
formmethod =
    stringProperty "formMethod"


{-| Constructs a contextualized HTML `formnovalidate` attribute.

Supported elements: `button`, `input`

-}
formnovalidate : Bool -> Attribute ctx msg
formnovalidate =
    boolProperty "formNoValidate"


{-| Constructs a contextualized HTML `formtarget` attribute.

Supported elements: `button`, `input`

-}
formtarget : String -> Attribute ctx msg
formtarget =
    stringProperty "formTarget"


{-| Constructs a contextualized HTML `headers` attribute.

Supported elements: `td`, `th`

-}
headers : String -> Attribute ctx msg
headers =
    stringProperty "headers"


{-| Constructs a contextualized HTML `height` attribute.

Supported elements: `canvas`, `embed`, `iframe`, `img`, `input`, `object`, `source`, `video`

-}
height : Int -> Attribute ctx msg
height =
    intProperty "height"


{-| Constructs a contextualized HTML `hidden` attribute.

Supported elements: _HTML elements_

-}
hidden : Bool -> Attribute ctx msg
hidden =
    boolProperty "hidden"


{-| Constructs a contextualized HTML `high` attribute.

Supported elements: `meter`

-}
high : Float -> Attribute ctx msg
high =
    floatProperty "high"


{-| Constructs a contextualized HTML `href` attribute.

Supported elements: `a`, `area`, `base`, `link`

-}
href : String -> Attribute ctx msg
href =
    stringProperty "href"


{-| Constructs a contextualized HTML `hreflang` attribute.

Supported elements: `a`, `link`

-}
hreflang : String -> Attribute ctx msg
hreflang =
    stringProperty "hreflang"


{-| Constructs a contextualized HTML `http-equiv` attribute.

Supported elements: `meta`

-}
httpEquiv : String -> Attribute ctx msg
httpEquiv =
    stringProperty "httpEquiv"


{-| Constructs a contextualized HTML `id` attribute.

Supported elements: _HTML elements_

-}
id : String -> Attribute ctx msg
id =
    stringProperty "id"


{-| Constructs a contextualized HTML `imagesizes` attribute.

Supported elements: `link`

-}
imagesizes : String -> Attribute ctx msg
imagesizes =
    stringProperty "imageSizes"


{-| Constructs a contextualized HTML `imagesrcset` attribute.

Supported elements: `link`

-}
imagesrcset : String -> Attribute ctx msg
imagesrcset =
    stringProperty "imageSrcset"


{-| Constructs a contextualized HTML `inert` attribute.

Supported elements: _HTML elements_

-}
inert : Bool -> Attribute ctx msg
inert =
    boolProperty "inert"


{-| Constructs a contextualized HTML `inputmode` attribute.

Supported elements: _HTML elements_

-}
inputmode : String -> Attribute ctx msg
inputmode =
    stringProperty "inputMode"


{-| Constructs a contextualized HTML `integrity` attribute.

Supported elements: `link`, `script`

> **_NOTE:_** The HTML `script` element is omitted in this package due to incompatibility with Elm.

-}
integrity : String -> Attribute ctx msg
integrity =
    stringProperty "integrity"


{-| Constructs a contextualized HTML `is` attribute.

Supported elements: _HTML elements_

-}
is : String -> Attribute ctx msg
is =
    attribute "is"


{-| Constructs a contextualized HTML `ismap` attribute.

Supported elements: `img`

-}
ismap : Bool -> Attribute ctx msg
ismap =
    boolProperty "isMap"


{-| Constructs a contextualized HTML `itemid` attribute.

Supported elements: _HTML elements_

-}
itemid : String -> Attribute ctx msg
itemid =
    attribute "itemid"


{-| Constructs a contextualized HTML `itemprop` attribute.

Supported elements: _HTML elements_

-}
itemprop : String -> Attribute ctx msg
itemprop =
    attribute "itemprop"


{-| Constructs a contextualized HTML `itemref` attribute.

Supported elements: _HTML elements_

-}
itemref : String -> Attribute ctx msg
itemref =
    attribute "itemref"


{-| Constructs a contextualized HTML `itemscope` attribute.

Supported elements: _HTML elements_

-}
itemscope : String -> Attribute ctx msg
itemscope =
    attribute "itemscope"


{-| Constructs a contextualized HTML `itemtype` attribute.

Supported elements: _HTML elements_

-}
itemtype : String -> Attribute ctx msg
itemtype =
    attribute "itemtype"


{-| Constructs a contextualized HTML `kind` attribute.

Supported elements: `track`

-}
kind : String -> Attribute ctx msg
kind =
    stringProperty "kind"


{-| Constructs a contextualized HTML `label` attribute.

Supported elements: `optgroup`, `option`, `track`

-}
label : String -> Attribute ctx msg
label =
    stringProperty "label"


{-| Constructs a contextualized HTML `lang` attribute.

Supported elements: _HTML elements_

-}
lang : String -> Attribute ctx msg
lang =
    stringProperty "lang"


{-| Constructs a contextualized HTML `list` attribute.

Supported elements: `input`

-}
list : String -> Attribute ctx msg
list =
    attribute "list"


{-| Constructs a contextualized HTML `loading` attribute.

Supported elements: `iframe`, `img`

-}
loading : String -> Attribute ctx msg
loading =
    stringProperty "loading"


{-| Constructs a contextualized HTML `loop` attribute.

Supported elements: `audio`, `video`

-}
loop : Bool -> Attribute ctx msg
loop =
    boolProperty "loop"


{-| Constructs a contextualized HTML `low` attribute.

Supported elements: `meter`

-}
low : Float -> Attribute ctx msg
low =
    floatProperty "low"


{-| Constructs a contextualized HTML `max` attribute.

Supported elements: `input`, `meter`, `progress`

-}
max : String -> Attribute ctx msg
max =
    stringProperty "max"


{-| Constructs a contextualized HTML `maxlength` attribute.

Supported elements: `input`, `textarea`

-}
maxlength : Int -> Attribute ctx msg
maxlength =
    intProperty "maxLength"


{-| Constructs a contextualized HTML `media` attribute.

Supported elements: `link`, `meta`, `source`, `style`

-}
media : String -> Attribute ctx msg
media =
    stringProperty "media"


{-| Constructs a contextualized HTML `method` attribute.

Supported elements: `form`

-}
method : String -> Attribute ctx msg
method =
    stringProperty "method"


{-| Constructs a contextualized HTML `min` attribute.

Supported elements: `input`, `meter`

-}
min : Float -> Attribute ctx msg
min =
    floatProperty "min"


{-| Constructs a contextualized HTML `minlength` attribute.

Supported elements: `input`, `textarea`

-}
minlength : Int -> Attribute ctx msg
minlength =
    intProperty "minLength"


{-| Constructs a contextualized HTML `multiple` attribute.

Supported elements: `input`, `select`

-}
multiple : Bool -> Attribute ctx msg
multiple =
    boolProperty "multiple"


{-| Constructs a contextualized HTML `muted` attribute.

Supported elements: `audio`, `video`

-}
muted : Bool -> Attribute ctx msg
muted =
    boolProperty "muted"


{-| Constructs a contextualized HTML `name` attribute.

Supported elements: `button`, `details`, `fieldset`, `form`, `iframe`, `input`, `map`, `object`, `output`, `select`, `slot`, `textarea`, _form-associated custom elements_

-}
name : String -> Attribute ctx msg
name =
    stringProperty "name"


{-| Constructs a contextualized HTML `nonce` attribute.

Supported elements: _HTML elements_

-}
nonce : String -> Attribute ctx msg
nonce =
    stringProperty "nonce"


{-| Constructs a contextualized HTML `novalidate` attribute.

Supported elements: `form`

-}
novalidate : Bool -> Attribute ctx msg
novalidate =
    boolProperty "noValidate"


{-| Constructs a contextualized HTML `open` attribute.

Supported elements: `details`, `dialog`

-}
open : Bool -> Attribute ctx msg
open =
    boolProperty "open"


{-| Constructs a contextualized HTML `optimum` attribute.

Supported elements: `meter`

-}
optimum : Float -> Attribute ctx msg
optimum =
    floatProperty "optimum"


{-| Constructs a contextualized HTML `pattern` attribute.

Supported elements: `input`

-}
pattern : String -> Attribute ctx msg
pattern =
    stringProperty "pattern"


{-| Constructs a contextualized HTML `ping` attribute.

Supported elements: `a`, `area`

-}
ping : String -> Attribute ctx msg
ping =
    stringProperty "ping"


{-| Constructs a contextualized HTML `placeholder` attribute.

Supported elements: `input`, `textarea`

-}
placeholder : String -> Attribute ctx msg
placeholder =
    stringProperty "placeholder"


{-| Constructs a contextualized HTML `playsinline` attribute.

Supported elements: `video`

-}
playsinline : Bool -> Attribute ctx msg
playsinline =
    boolProperty "playsInline"


{-| Constructs a contextualized HTML `popover` attribute.

Supported elements: _HTML elements_

-}
popover : String -> Attribute ctx msg
popover =
    stringProperty "popover"


{-| Constructs a contextualized HTML `popovertarget` attribute.

Supported elements: `button`, `input`

-}
popovertarget : String -> Attribute ctx msg
popovertarget =
    stringProperty "popoverTarget"


{-| Constructs a contextualized HTML `popovertargetaction` attribute.

Supported elements: `button`, `input`

-}
popovertargetaction : String -> Attribute ctx msg
popovertargetaction =
    stringProperty "popoverTargetAction"


{-| Constructs a contextualized HTML `poster` attribute.

Supported elements: `video`

-}
poster : String -> Attribute ctx msg
poster =
    stringProperty "poster"


{-| Constructs a contextualized HTML `preload` attribute.

Supported elements: `audio`, `video`

-}
preload : String -> Attribute ctx msg
preload =
    stringProperty "preload"


{-| Constructs a contextualized HTML `readonly` attribute.

Supported elements: `input`, `textarea`, _form-associated custom elements_

-}
readonly : Bool -> Attribute ctx msg
readonly =
    boolProperty "readOnly"


{-| Constructs a contextualized HTML `referrerpolicy` attribute.

Supported elements: `a`, `area`, `iframe`, `img`, `link`, `script`

> **_NOTE:_** The HTML `script` element is omitted in this package due to incompatibility with Elm.

-}
referrerpolicy : String -> Attribute ctx msg
referrerpolicy =
    stringProperty "referrerPolicy"


{-| Constructs a contextualized HTML `rel` attribute.

Supported elements: `a`, `area`, `link`

-}
rel : String -> Attribute ctx msg
rel =
    stringProperty "rel"


{-| Constructs a contextualized HTML `required` attribute.

Supported elements: `input`, `select`, `textarea`

-}
required : Bool -> Attribute ctx msg
required =
    boolProperty "required"


{-| Constructs a contextualized HTML `reversed` attribute.

Supported elements: `ol`

-}
reversed : Bool -> Attribute ctx msg
reversed =
    boolProperty "reversed"


{-| Constructs a contextualized HTML `rows` attribute.

Supported elements: `textarea`

-}
rows : Int -> Attribute ctx msg
rows =
    intProperty "rows"


{-| Constructs a contextualized HTML `rowspan` attribute.

Supported elements: `td`, `th`

-}
rowspan : Int -> Attribute ctx msg
rowspan =
    intProperty "rowSpan"


{-| Constructs a contextualized HTML `sandbox` attribute.

Supported elements: `iframe`

-}
sandbox : String -> Attribute ctx msg
sandbox =
    stringProperty "sandbox"


{-| Constructs a contextualized HTML `scope` attribute.

Supported elements: `th`

-}
scope : String -> Attribute ctx msg
scope =
    stringProperty "scope"


{-| Constructs a contextualized HTML `selected` attribute.

Supported elements: `option`

-}
selected : Bool -> Attribute ctx msg
selected =
    boolProperty "selected"


{-| Constructs a contextualized HTML `shadowrootclonable` attribute.

Supported elements: `template`

-}
shadowrootclonable : Bool -> Attribute ctx msg
shadowrootclonable =
    boolProperty "shadowRootClonable"


{-| Constructs a contextualized HTML `shadowrootdelegatesfocus` attribute.

Supported elements: `template`

-}
shadowrootdelegatesfocus : Bool -> Attribute ctx msg
shadowrootdelegatesfocus =
    boolProperty "shadowRootDelegatesFocus"


{-| Constructs a contextualized HTML `shadowrootmode` attribute.

Supported elements: `template`

-}
shadowrootmode : String -> Attribute ctx msg
shadowrootmode =
    stringProperty "shadowRootMode"


{-| Constructs a contextualized HTML `shadowrootserializable` attribute.

Supported elements: `template`

-}
shadowrootserializable : Bool -> Attribute ctx msg
shadowrootserializable =
    boolProperty "shadowRootSerializable"


{-| Constructs a contextualized HTML `shape` attribute.

Supported elements: `area`

-}
shape : String -> Attribute ctx msg
shape =
    stringProperty "shape"


{-| Constructs a contextualized HTML `size` attribute.

Supported elements: `input`, `select`

-}
size : Int -> Attribute ctx msg
size =
    intProperty "size"


{-| Constructs a contextualized HTML `sizes` attribute.

Supported elements: `link`

-}
sizes : String -> Attribute ctx msg
sizes =
    stringProperty "sizes"


{-| Constructs a contextualized HTML `slot` attribute.

Supported elements: _HTML elements_

-}
slot : String -> Attribute ctx msg
slot =
    stringProperty "slot"


{-| Constructs a contextualized HTML `span` attribute.

Supported elements: `col`, `colgroup`

-}
span : Int -> Attribute ctx msg
span =
    intProperty "span"


{-| Constructs a contextualized HTML `spellcheck` attribute.

Supported elements: _HTML elements_

-}
spellcheck : Bool -> Attribute ctx msg
spellcheck =
    boolProperty "spellcheck"


{-| Constructs a contextualized HTML `src` attribute.

Supported elements: `audio`, `embed`, `iframe`, `img`, `input`, `script`, `source`, `track`, `video`

> **_NOTE:_** The HTML `script` element is omitted in this package due to incompatibility with Elm.

-}
src : String -> Attribute ctx msg
src =
    stringProperty "src"


{-| Constructs a contextualized HTML `srcdoc` attribute.

Supported elements: `iframe`

-}
srcdoc : String -> Attribute ctx msg
srcdoc =
    stringProperty "srcdoc"


{-| Constructs a contextualized HTML `srclang` attribute.

Supported elements: `track`

-}
srclang : String -> Attribute ctx msg
srclang =
    stringProperty "srclang"


{-| Constructs a contextualized HTML `srcset` attribute.

Supported elements: `img`, `source`

-}
srcset : String -> Attribute ctx msg
srcset =
    stringProperty "srcset"


{-| Constructs a contextualized HTML `start` attribute.

Supported elements: `ol`

-}
start : Int -> Attribute ctx msg
start =
    intProperty "start"


{-| Constructs a contextualized HTML `step` attribute.

Supported elements: `input`

-}
step : String -> Attribute ctx msg
step =
    stringProperty "step"


{-| Constructs a contextualized HTML `style` attribute.

Supported elements: _HTML elements_

-}
style : String -> Attribute ctx msg
style =
    stringProperty "style"


{-| Appends a style to the contextualized HTML `style` attribute.

Supported elements: _HTML elements_

-}
style2 : String -> String -> Attribute ctx msg
style2 =
    Internal.style2


{-| Constructs a contextualized HTML `tabindex` attribute.

Supported elements: _HTML elements_

-}
tabindex : Int -> Attribute ctx msg
tabindex =
    intProperty "tabIndex"


{-| Constructs a contextualized HTML `target` attribute.

Supported elements: `a`, `area`, `base`, `form`

-}
target : String -> Attribute ctx msg
target =
    stringProperty "target"


{-| Constructs a contextualized HTML `title` attribute.

Supported elements: _HTML elements_

-}
title : String -> Attribute ctx msg
title =
    stringProperty "title"


{-| Constructs a contextualized HTML `translate` attribute.

Supported elements: _HTML elements_

-}
translate : Bool -> Attribute ctx msg
translate =
    boolProperty "translate"


{-| Constructs a contextualized HTML `type` attribute.

Supported elements: `a`, `button`, `embed`, `input`, `link`, `object`, `ol`, `script`, `source`

> **_NOTE:_** The HTML `script` element is omitted in this package due to incompatibility with Elm.

-}
type_ : String -> Attribute ctx msg
type_ =
    stringProperty "type"


{-| Constructs a contextualized HTML `usemap` attribute.

Supported elements: `img`

-}
usemap : String -> Attribute ctx msg
usemap =
    stringProperty "useMap"


{-| Constructs a contextualized HTML `value` attribute.

Supported elements: `button`, `data`, `input`, `li`, `meter`, `option`, `progress`

-}
value : String -> Attribute ctx msg
value =
    stringProperty "value"


{-| Constructs a contextualized HTML `width` attribute.

Supported elements: `canvas`, `embed`, `iframe`, `img`, `input`, `object`, `source`, `video`

-}
width : Int -> Attribute ctx msg
width =
    intProperty "width"


{-| Constructs a contextualized HTML `wrap` attribute.

Supported elements: `textarea`

-}
wrap : String -> Attribute ctx msg
wrap =
    stringProperty "wrap"


{-| Constructs a contextualized HTML `writingsuggestions` attribute.

Supported elements: _HTML elements_

-}
writingsuggestions : Bool -> Attribute ctx msg
writingsuggestions =
    boolProperty "writingSuggestions"
