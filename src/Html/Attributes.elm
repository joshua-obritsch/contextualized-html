module Html.Attributes exposing
    ( contextualize, decontextualize
    , using
    , mapAttribute
    , property, boolProperty, floatProperty, intProperty, stringProperty
    , attribute
    , abbr, accept, acceptCharset, accesskey, action, allow, allowfullscreen, alt, as_, async, autocapitalize, autocomplete, autofocus, autoplay, blocking, charset, checked, cite, class, color, cols, colspan, content, contenteditable, controls, coords, crossorigin, data, datetime, decoding, default, defer, dir, disabled, download, draggable, enctype, enterkeyhint, fetchpriority, for, form, formaction, formenctype, formmethod, formnovalidate, formtarget, headers, height, hidden, high, href, hreflang, httpEquiv, id, imagesizes, imagesrcset, inert, inputmode, integrity, is, ismap, itemid, itemprop, itemref, itemscope, itemtype, kind, label, lang, list, loading, loop, low, max, maxlength, media, method, min, minlength, multiple, muted, name, nomodule, nonce, novalidate, open, optimum, pattern, ping, placeholder, playsinline, popover, popovertarget, popovertargetaction, poster, preload, readonly, referrerpolicy, rel, required, reversed, rows, rowspan, sandbox, scope, selected, shadowrootclonable, shadowrootdelegatesfocus, shadowrootmode, shadowrootserializable, shape, size, sizes, slot, span, spellcheck, src, srcdoc, srclang, srcset, start, step, style, tabindex, target, title, translate, type_, usemap, value, width, wrap, writingsuggestions
    )

{-| This module provides a set of types and functions for generating context-dependent HTML attributes.


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

@docs abbr, accept, acceptCharset, accesskey, action, allow, allowfullscreen, alt, as_, async, autocapitalize, autocomplete, autofocus, autoplay, blocking, charset, checked, cite, class, color, cols, colspan, content, contenteditable, controls, coords, crossorigin, data, datetime, decoding, default, defer, dir, disabled, download, draggable, enctype, enterkeyhint, fetchpriority, for, form, formaction, formenctype, formmethod, formnovalidate, formtarget, headers, height, hidden, high, href, hreflang, httpEquiv, id, imagesizes, imagesrcset, inert, inputmode, integrity, is, ismap, itemid, itemprop, itemref, itemscope, itemtype, kind, label, lang, list, loading, loop, low, max, maxlength, media, method, min, minlength, multiple, muted, name, nomodule, nonce, novalidate, open, optimum, pattern, ping, placeholder, playsinline, popover, popovertarget, popovertargetaction, poster, preload, readonly, referrerpolicy, rel, required, reversed, rows, rowspan, sandbox, scope, selected, shadowrootclonable, shadowrootdelegatesfocus, shadowrootmode, shadowrootserializable, shape, size, sizes, slot, span, spellcheck, src, srcdoc, srclang, srcset, start, step, style, tabindex, target, title, translate, type_, usemap, value, width, wrap, writingsuggestions

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
-}
abbr : String -> Attribute ctx msg
abbr =
    stringProperty "abbr"


{-| Constructs a contextualized HTML `accept` attribute.
-}
accept : String -> Attribute ctx msg
accept =
    stringProperty "accept"


{-| Constructs a contextualized HTML `accept-charset` attribute.
-}
acceptCharset : String -> Attribute ctx msg
acceptCharset =
    stringProperty "acceptCharset"


{-| Constructs a contextualized HTML `accesskey` attribute.
-}
accesskey : String -> Attribute ctx msg
accesskey =
    stringProperty "accessKey"


{-| Constructs a contextualized HTML `action` attribute.
-}
action : String -> Attribute ctx msg
action =
    stringProperty "action"


{-| Constructs a contextualized HTML `allow` attribute.
-}
allow : String -> Attribute ctx msg
allow =
    stringProperty "allow"


{-| Constructs a contextualized HTML `allowfullscreen` attribute.
-}
allowfullscreen : Bool -> Attribute ctx msg
allowfullscreen =
    boolProperty "allowFullscreen"


{-| Constructs a contextualized HTML `alt` attribute.
-}
alt : String -> Attribute ctx msg
alt =
    stringProperty "alt"


{-| Constructs a contextualized HTML `as` attribute.
-}
as_ : String -> Attribute ctx msg
as_ =
    stringProperty "as"


{-| Constructs a contextualized HTML `async` attribute.
-}
async : Bool -> Attribute ctx msg
async =
    boolProperty "async"


{-| Constructs a contextualized HTML `autocapitalize` attribute.
-}
autocapitalize : String -> Attribute ctx msg
autocapitalize =
    stringProperty "autocapitalize"


{-| Constructs a contextualized HTML `autocomplete` attribute.
-}
autocomplete : String -> Attribute ctx msg
autocomplete =
    stringProperty "autocomplete"


{-| Constructs a contextualized HTML `autofocus` attribute.
-}
autofocus : Bool -> Attribute ctx msg
autofocus =
    boolProperty "autofocus"


{-| Constructs a contextualized HTML `autoplay` attribute.
-}
autoplay : Bool -> Attribute ctx msg
autoplay =
    boolProperty "autoplay"


{-| Constructs a contextualized HTML `blocking` attribute.
-}
blocking : String -> Attribute ctx msg
blocking =
    stringProperty "blocking"


{-| Constructs a contextualized HTML `charset` attribute.
-}
charset : String -> Attribute ctx msg
charset =
    stringProperty "charset"


{-| Constructs a contextualized HTML `checked` attribute.
-}
checked : Bool -> Attribute ctx msg
checked =
    boolProperty "checked"


{-| Constructs a contextualized HTML `cite` attribute.
-}
cite : String -> Attribute ctx msg
cite =
    stringProperty "cite"


{-| Constructs a contextualized HTML `class` attribute.
-}
class : String -> Attribute ctx msg
class =
    stringProperty "className"


{-| Constructs a contextualized HTML `color` attribute.
-}
color : String -> Attribute ctx msg
color =
    stringProperty "color"


{-| Constructs a contextualized HTML `cols` attribute.
-}
cols : Int -> Attribute ctx msg
cols =
    intProperty "cols"


{-| Constructs a contextualized HTML `colspan` attribute.
-}
colspan : Int -> Attribute ctx msg
colspan =
    intProperty "colSpan"


{-| Constructs a contextualized HTML `content` attribute.
-}
content : String -> Attribute ctx msg
content =
    stringProperty "content"


{-| Constructs a contextualized HTML `contenteditable` attribute.
-}
contenteditable : String -> Attribute ctx msg
contenteditable =
    stringProperty "contentEditable"


{-| Constructs a contextualized HTML `controls` attribute.
-}
controls : Bool -> Attribute ctx msg
controls =
    boolProperty "controls"


{-| Constructs a contextualized HTML `coords` attribute.
-}
coords : String -> Attribute ctx msg
coords =
    stringProperty "coords"


{-| Constructs a contextualized HTML `crossorigin` attribute.
-}
crossorigin : String -> Attribute ctx msg
crossorigin =
    stringProperty "crossOrigin"


{-| Constructs a contextualized HTML `data` attribute.
-}
data : String -> Attribute ctx msg
data =
    stringProperty "data"


{-| Constructs a contextualized HTML `datetime` attribute.
-}
datetime : String -> Attribute ctx msg
datetime =
    stringProperty "dateTime"


{-| Constructs a contextualized HTML `decoding` attribute.
-}
decoding : String -> Attribute ctx msg
decoding =
    stringProperty "decoding"


{-| Constructs a contextualized HTML `default` attribute.
-}
default : Bool -> Attribute ctx msg
default =
    boolProperty "default"


{-| Constructs a contextualized HTML `defer` attribute.
-}
defer : Bool -> Attribute ctx msg
defer =
    boolProperty "defer"


{-| Constructs a contextualized HTML `dir` attribute.
-}
dir : String -> Attribute ctx msg
dir =
    stringProperty "dir"


{-| Constructs a contextualized HTML `disabled` attribute.
-}
disabled : Bool -> Attribute ctx msg
disabled =
    boolProperty "disabled"


{-| Constructs a contextualized HTML `download` attribute.
-}
download : String -> Attribute ctx msg
download =
    stringProperty "download"


{-| Constructs a contextualized HTML `draggable` attribute.
-}
draggable : Bool -> Attribute ctx msg
draggable =
    boolProperty "draggable"


{-| Constructs a contextualized HTML `enctype` attribute.
-}
enctype : String -> Attribute ctx msg
enctype =
    stringProperty "enctype"


{-| Constructs a contextualized HTML `enterkeyhint` attribute.
-}
enterkeyhint : String -> Attribute ctx msg
enterkeyhint =
    stringProperty "enterKeyHint"


{-| Constructs a contextualized HTML `fetchpriority` attribute.
-}
fetchpriority : String -> Attribute ctx msg
fetchpriority =
    stringProperty "fetchPriority"


{-| Constructs a contextualized HTML `for` attribute.
-}
for : String -> Attribute ctx msg
for =
    stringProperty "htmlFor"


{-| Constructs a contextualized HTML `form` attribute.
-}
form : String -> Attribute ctx msg
form =
    stringProperty "form"


{-| Constructs a contextualized HTML `formaction` attribute.
-}
formaction : String -> Attribute ctx msg
formaction =
    stringProperty "formAction"


{-| Constructs a contextualized HTML `formenctype` attribute.
-}
formenctype : String -> Attribute ctx msg
formenctype =
    stringProperty "formEnctype"


{-| Constructs a contextualized HTML `formmethod` attribute.
-}
formmethod : String -> Attribute ctx msg
formmethod =
    stringProperty "formMethod"


{-| Constructs a contextualized HTML `formnovalidate` attribute.
-}
formnovalidate : Bool -> Attribute ctx msg
formnovalidate =
    boolProperty "formNoValidate"


{-| Constructs a contextualized HTML `formtarget` attribute.
-}
formtarget : String -> Attribute ctx msg
formtarget =
    stringProperty "formTarget"


{-| Constructs a contextualized HTML `headers` attribute.
-}
headers : String -> Attribute ctx msg
headers =
    stringProperty "headers"


{-| Constructs a contextualized HTML `height` attribute.
-}
height : Int -> Attribute ctx msg
height =
    intProperty "height"


{-| Constructs a contextualized HTML `hidden` attribute.
-}
hidden : Bool -> Attribute ctx msg
hidden =
    boolProperty "hidden"


{-| Constructs a contextualized HTML `high` attribute.
-}
high : Float -> Attribute ctx msg
high =
    floatProperty "high"


{-| Constructs a contextualized HTML `href` attribute.
-}
href : String -> Attribute ctx msg
href =
    stringProperty "href"


{-| Constructs a contextualized HTML `hreflang` attribute.
-}
hreflang : String -> Attribute ctx msg
hreflang =
    stringProperty "hreflang"


{-| Constructs a contextualized HTML `http-equiv` attribute.
-}
httpEquiv : String -> Attribute ctx msg
httpEquiv =
    stringProperty "httpEquiv"


{-| Constructs a contextualized HTML `id` attribute.
-}
id : String -> Attribute ctx msg
id =
    stringProperty "id"


{-| Constructs a contextualized HTML `imagesizes` attribute.
-}
imagesizes : String -> Attribute ctx msg
imagesizes =
    stringProperty "imagesizes"


{-| Constructs a contextualized HTML `imagesrcset` attribute.
-}
imagesrcset : String -> Attribute ctx msg
imagesrcset =
    stringProperty "imagesrcset"


{-| Constructs a contextualized HTML `inert` attribute.
-}
inert : Bool -> Attribute ctx msg
inert =
    boolProperty "inert"


{-| Constructs a contextualized HTML `inputmode` attribute.
-}
inputmode : String -> Attribute ctx msg
inputmode =
    stringProperty "inputMode"


{-| Constructs a contextualized HTML `integrity` attribute.
-}
integrity : String -> Attribute ctx msg
integrity =
    stringProperty "integrity"


{-| Constructs a contextualized HTML `is` attribute.
-}
is : String -> Attribute ctx msg
is =
    stringProperty "is"


{-| Constructs a contextualized HTML `ismap` attribute.
-}
ismap : Bool -> Attribute ctx msg
ismap =
    boolProperty "isMap"


{-| Constructs a contextualized HTML `itemid` attribute.
-}
itemid : String -> Attribute ctx msg
itemid =
    stringProperty "itemid"


{-| Constructs a contextualized HTML `itemprop` attribute.
-}
itemprop : String -> Attribute ctx msg
itemprop =
    stringProperty "itemprop"


{-| Constructs a contextualized HTML `itemref` attribute.
-}
itemref : String -> Attribute ctx msg
itemref =
    stringProperty "itemref"


{-| Constructs a contextualized HTML `itemscope` attribute.
-}
itemscope : Bool -> Attribute ctx msg
itemscope =
    boolProperty "itemscope"


{-| Constructs a contextualized HTML `itemtype` attribute.
-}
itemtype : String -> Attribute ctx msg
itemtype =
    stringProperty "itemtype"


{-| Constructs a contextualized HTML `kind` attribute.
-}
kind : String -> Attribute ctx msg
kind =
    stringProperty "kind"


{-| Constructs a contextualized HTML `label` attribute.
-}
label : String -> Attribute ctx msg
label =
    stringProperty "label"


{-| Constructs a contextualized HTML `lang` attribute.
-}
lang : String -> Attribute ctx msg
lang =
    stringProperty "lang"


{-| Constructs a contextualized HTML `list` attribute.
-}
list : String -> Attribute ctx msg
list =
    stringProperty "list"


{-| Constructs a contextualized HTML `loading` attribute.
-}
loading : String -> Attribute ctx msg
loading =
    stringProperty "loading"


{-| Constructs a contextualized HTML `loop` attribute.
-}
loop : Bool -> Attribute ctx msg
loop =
    boolProperty "loop"


{-| Constructs a contextualized HTML `low` attribute.
-}
low : Float -> Attribute ctx msg
low =
    floatProperty "low"


{-| Constructs a contextualized HTML `max` attribute.
-}
max : Float -> Attribute ctx msg
max =
    floatProperty "max"


{-| Constructs a contextualized HTML `maxlength` attribute.
-}
maxlength : Int -> Attribute ctx msg
maxlength =
    intProperty "maxLength"


{-| Constructs a contextualized HTML `media` attribute.
-}
media : String -> Attribute ctx msg
media =
    stringProperty "media"


{-| Constructs a contextualized HTML `method` attribute.
-}
method : String -> Attribute ctx msg
method =
    stringProperty "method"


{-| Constructs a contextualized HTML `min` attribute.
-}
min : Float -> Attribute ctx msg
min =
    floatProperty "min"


{-| Constructs a contextualized HTML `minlength` attribute.
-}
minlength : Int -> Attribute ctx msg
minlength =
    intProperty "minLength"


{-| Constructs a contextualized HTML `multiple` attribute.
-}
multiple : Bool -> Attribute ctx msg
multiple =
    boolProperty "multiple"


{-| Constructs a contextualized HTML `muted` attribute.
-}
muted : Bool -> Attribute ctx msg
muted =
    boolProperty "muted"


{-| Constructs a contextualized HTML `name` attribute.
-}
name : String -> Attribute ctx msg
name =
    stringProperty "name"


{-| Constructs a contextualized HTML `nomodule` attribute.
-}
nomodule : Bool -> Attribute ctx msg
nomodule =
    boolProperty "noModule"


{-| Constructs a contextualized HTML `nonce` attribute.
-}
nonce : String -> Attribute ctx msg
nonce =
    stringProperty "nonce"


{-| Constructs a contextualized HTML `novalidate` attribute.
-}
novalidate : Bool -> Attribute ctx msg
novalidate =
    boolProperty "noValidate"


{-| Constructs a contextualized HTML `open` attribute.
-}
open : Bool -> Attribute ctx msg
open =
    boolProperty "open"


{-| Constructs a contextualized HTML `optimum` attribute.
-}
optimum : Float -> Attribute ctx msg
optimum =
    floatProperty "optimum"


{-| Constructs a contextualized HTML `pattern` attribute.
-}
pattern : String -> Attribute ctx msg
pattern =
    stringProperty "pattern"


{-| Constructs a contextualized HTML `ping` attribute.
-}
ping : String -> Attribute ctx msg
ping =
    stringProperty "ping"


{-| Constructs a contextualized HTML `placeholder` attribute.
-}
placeholder : String -> Attribute ctx msg
placeholder =
    stringProperty "placeholder"


{-| Constructs a contextualized HTML `playsinline` attribute.
-}
playsinline : Bool -> Attribute ctx msg
playsinline =
    boolProperty "playsInline"


{-| Constructs a contextualized HTML `popover` attribute.
-}
popover : String -> Attribute ctx msg
popover =
    stringProperty "popover"


{-| Constructs a contextualized HTML `popovertarget` attribute.
-}
popovertarget : String -> Attribute ctx msg
popovertarget =
    stringProperty "popoverTarget"


{-| Constructs a contextualized HTML `popovertargetaction` attribute.
-}
popovertargetaction : String -> Attribute ctx msg
popovertargetaction =
    stringProperty "popoverTargetAction"


{-| Constructs a contextualized HTML `poster` attribute.
-}
poster : String -> Attribute ctx msg
poster =
    stringProperty "poster"


{-| Constructs a contextualized HTML `preload` attribute.
-}
preload : String -> Attribute ctx msg
preload =
    stringProperty "preload"


{-| Constructs a contextualized HTML `readonly` attribute.
-}
readonly : Bool -> Attribute ctx msg
readonly =
    boolProperty "readOnly"


{-| Constructs a contextualized HTML `referrerpolicy` attribute.
-}
referrerpolicy : String -> Attribute ctx msg
referrerpolicy =
    stringProperty "referrerPolicy"


{-| Constructs a contextualized HTML `rel` attribute.
-}
rel : String -> Attribute ctx msg
rel =
    stringProperty "rel"


{-| Constructs a contextualized HTML `required` attribute.
-}
required : Bool -> Attribute ctx msg
required =
    boolProperty "required"


{-| Constructs a contextualized HTML `reversed` attribute.
-}
reversed : Bool -> Attribute ctx msg
reversed =
    boolProperty "reversed"


{-| Constructs a contextualized HTML `rows` attribute.
-}
rows : Int -> Attribute ctx msg
rows =
    intProperty "rows"


{-| Constructs a contextualized HTML `rowspan` attribute.
-}
rowspan : Int -> Attribute ctx msg
rowspan =
    intProperty "rowSpan"


{-| Constructs a contextualized HTML `sandbox` attribute.
-}
sandbox : String -> Attribute ctx msg
sandbox =
    stringProperty "sandbox"


{-| Constructs a contextualized HTML `scope` attribute.
-}
scope : String -> Attribute ctx msg
scope =
    stringProperty "scope"


{-| Constructs a contextualized HTML `selected` attribute.
-}
selected : Bool -> Attribute ctx msg
selected =
    boolProperty "selected"


{-| Constructs a contextualized HTML `shadowrootclonable` attribute.
-}
shadowrootclonable : Bool -> Attribute ctx msg
shadowrootclonable =
    boolProperty "shadowRootClonable"


{-| Constructs a contextualized HTML `shadowrootdelegatesfocus` attribute.
-}
shadowrootdelegatesfocus : Bool -> Attribute ctx msg
shadowrootdelegatesfocus =
    boolProperty "shadowRootDelegatesFocus"


{-| Constructs a contextualized HTML `shadowrootmode` attribute.
-}
shadowrootmode : String -> Attribute ctx msg
shadowrootmode =
    stringProperty "shadowRootMode"


{-| Constructs a contextualized HTML `shadowrootserializable` attribute.
-}
shadowrootserializable : Bool -> Attribute ctx msg
shadowrootserializable =
    boolProperty "shadowRootSerializable"


{-| Constructs a contextualized HTML `shape` attribute.
-}
shape : String -> Attribute ctx msg
shape =
    stringProperty "shape"


{-| Constructs a contextualized HTML `size` attribute.
-}
size : Int -> Attribute ctx msg
size =
    intProperty "size"


{-| Constructs a contextualized HTML `sizes` attribute.
-}
sizes : String -> Attribute ctx msg
sizes =
    stringProperty "sizes"


{-| Constructs a contextualized HTML `slot` attribute.
-}
slot : String -> Attribute ctx msg
slot =
    stringProperty "slot"


{-| Constructs a contextualized HTML `span` attribute.
-}
span : Int -> Attribute ctx msg
span =
    intProperty "span"


{-| Constructs a contextualized HTML `spellcheck` attribute.
-}
spellcheck : Bool -> Attribute ctx msg
spellcheck =
    boolProperty "spellcheck"


{-| Constructs a contextualized HTML `src` attribute.
-}
src : String -> Attribute ctx msg
src =
    stringProperty "src"


{-| Constructs a contextualized HTML `srcdoc` attribute.
-}
srcdoc : String -> Attribute ctx msg
srcdoc =
    stringProperty "srcdoc"


{-| Constructs a contextualized HTML `srclang` attribute.
-}
srclang : String -> Attribute ctx msg
srclang =
    stringProperty "srclang"


{-| Constructs a contextualized HTML `srcset` attribute.
-}
srcset : String -> Attribute ctx msg
srcset =
    stringProperty "srcset"


{-| Constructs a contextualized HTML `start` attribute.
-}
start : Int -> Attribute ctx msg
start =
    intProperty "start"


{-| Constructs a contextualized HTML `step` attribute.
-}
step : String -> Attribute ctx msg
step =
    stringProperty "step"


{-| Constructs a contextualized HTML `style` attribute.
-}
style : String -> String -> Attribute ctx msg
style =
    Internal.style


{-| Constructs a contextualized HTML `tabindex` attribute.
-}
tabindex : Int -> Attribute ctx msg
tabindex =
    intProperty "tabIndex"


{-| Constructs a contextualized HTML `target` attribute.
-}
target : String -> Attribute ctx msg
target =
    stringProperty "target"


{-| Constructs a contextualized HTML `title` attribute.
-}
title : String -> Attribute ctx msg
title =
    stringProperty "title"


{-| Constructs a contextualized HTML `translate` attribute.
-}
translate : Bool -> Attribute ctx msg
translate =
    boolProperty "translate"


{-| Constructs a contextualized HTML `type` attribute.
-}
type_ : String -> Attribute ctx msg
type_ =
    stringProperty "type"


{-| Constructs a contextualized HTML `usemap` attribute.
-}
usemap : String -> Attribute ctx msg
usemap =
    stringProperty "useMap"


{-| Constructs a contextualized HTML `value` attribute.
-}
value : String -> Attribute ctx msg
value =
    stringProperty "value"


{-| Constructs a contextualized HTML `width` attribute.
-}
width : Int -> Attribute ctx msg
width =
    intProperty "width"


{-| Constructs a contextualized HTML `wrap` attribute.
-}
wrap : String -> Attribute ctx msg
wrap =
    stringProperty "wrap"


{-| Constructs a contextualized HTML `writingsuggestions` attribute.
-}
writingsuggestions : Bool -> Attribute ctx msg
writingsuggestions =
    boolProperty "writingSuggestions"
