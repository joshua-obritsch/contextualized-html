module Html.Attributes exposing
    ( Attribute(..)
    , contextualize, decontextualize, using
    , abbr, accept, acceptCharset, accesskey, action, allow, allowfullscreen, alt, as_, autocapitalize, autocomplete, autofocus, autoplay, blocking, charset, checked, cite, class, color, cols, colspan, content, contenteditable, controls, coords, crossorigin, data, datetime, decoding, default, dir, dirname, disabled, download, draggable, enctype, enterkeyhint, fetchpriority, for, form, formaction, formenctype, formmethod, formnovalidate, formtarget, headers, height, hidden, high, href, hreflang, httpEquiv, id, imagesizes, imagesrcset, inert, inputmode, integrity, is, ismap, itemid, itemprop, itemref, itemscope, itemtype, kind, label, lang, list, loading, loop, low, max, maxlength, media, method, min, minlength, multiple, muted, name, nonce, novalidate, open, optimum, pattern, ping, placeholder, playsinline, popover, popovertarget, popovertargetaction, poster, preload, readonly, referrerpolicy, rel, required, reversed, rows, rowspan, sandbox, scope, selected, shadowrootclonable, shadowrootdelegatesfocus, shadowrootmode, shadowrootserializable, shape, size, sizes, slot, span, spellcheck, src, srcdoc, srclang, srcset, start, step, style, tabindex, target, title, translate, type_, usemap, value, width, wrap, writingsuggestions
    )

{-| This module provides a set of types and functions for generating context-dependent HTML attributes.

Removed: `async`, `nomodule`


# Types

@docs Attribute


# Contextualization

@docs contextualize, decontextualize, using


# Attributes

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

Supported elements: `th`

-}
abbr : String -> Attribute ctx msg
abbr val =
    property "abbr" (Json.string val)


{-| Constructs a contextualized HTML `accept` attribute.

Supported elements: `input`

-}
accept : String -> Attribute ctx msg
accept val =
    property "accept" (Json.string val)


{-| Constructs a contextualized HTML `accept-charset` attribute.

Supported elements: `form`

-}
acceptCharset : String -> Attribute ctx msg
acceptCharset val =
    property "acceptCharset" (Json.string val)


{-| Constructs a contextualized HTML `accesskey` attribute.

Supported elements: _HTML elements_

-}
accesskey : String -> Attribute ctx msg
accesskey val =
    property "accessKey" (Json.string val)


{-| Constructs a contextualized HTML `action` attribute.

Supported elements: `form`

-}
action : String -> Attribute ctx msg
action val =
    property "action" (Json.string val)


{-| Constructs a contextualized HTML `allow` attribute.

Supported elements: `iframe`

-}
allow : String -> Attribute ctx msg
allow val =
    property "allow" (Json.string val)


{-| Constructs a contextualized HTML `allowfullscreen` attribute.

Supported elements: `iframe`

-}
allowfullscreen : Bool -> Attribute ctx msg
allowfullscreen val =
    property "allowFullscreen" (Json.bool val)


{-| Constructs a contextualized HTML `alt` attribute.

Supported elements: `area`, `img`, `input`

-}
alt : String -> Attribute ctx msg
alt val =
    property "alt" (Json.string val)


{-| Constructs a contextualized HTML `as` attribute.

Supported elements: `link`

-}
as_ : String -> Attribute ctx msg
as_ val =
    property "as" (Json.string val)


{-| Constructs a contextualized HTML `autocapitalize` attribute.

Supported elements: _HTML elements_

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

Supported elements: _HTML elements_

-}
autofocus : Bool -> Attribute ctx msg
autofocus val =
    property "autofocus" (Json.bool val)


{-| Constructs a contextualized HTML `autoplay` attribute.

Supported elements: `audio`, `video`

-}
autoplay : Bool -> Attribute ctx msg
autoplay val =
    property "autoplay" (Json.bool val)


{-| Constructs a contextualized HTML `blocking` attribute.

Supported elements: `link`, `script`, `style`

> **_NOTE:_** The HTML `script` element is omitted in this package due to incompatibility with Elm.

-}
blocking : String -> Attribute ctx msg
blocking val =
    property "blocking" (Json.string val)


{-| Constructs a contextualized HTML `charset` attribute.

Supported elements: `meta`

-}
charset : String -> Attribute ctx msg
charset val =
    property "charset" (Json.string val)


{-| Constructs a contextualized HTML `checked` attribute.

Supported elements: `input`

-}
checked : Bool -> Attribute ctx msg
checked val =
    property "checked" (Json.bool val)


{-| Constructs a contextualized HTML `cite` attribute.

Supported elements: `blockquote`, `del`, `ins`, `q`

-}
cite : String -> Attribute ctx msg
cite val =
    property "cite" (Json.string val)


{-| Constructs a contextualized HTML `class` attribute.

Supported elements: _HTML elements_

-}
class : String -> Attribute ctx msg
class val =
    property "className" (Json.string val)


{-| Constructs a contextualized HTML `color` attribute.

Supported elements: `link`

-}
color : String -> Attribute ctx msg
color val =
    attribute "color" val


{-| Constructs a contextualized HTML `cols` attribute.

Supported elements: `textarea`

-}
cols : Int -> Attribute ctx msg
cols val =
    property "cols" (Json.int val)


{-| Constructs a contextualized HTML `colspan` attribute.

Supported elements: `td`, `th`

-}
colspan : Int -> Attribute ctx msg
colspan val =
    property "colSpan" (Json.int val)


{-| Constructs a contextualized HTML `content` attribute.

Supported elements: `meta`

-}
content : String -> Attribute ctx msg
content val =
    property "content" (Json.string val)


{-| Constructs a contextualized HTML `contenteditable` attribute.

Supported elements: _HTML elements_

-}
contenteditable : String -> Attribute ctx msg
contenteditable val =
    property "contentEditable" (Json.string val)


{-| Constructs a contextualized HTML `controls` attribute.

Supported elements: `audio`, `video`

-}
controls : Bool -> Attribute ctx msg
controls val =
    property "controls" (Json.bool val)


{-| Constructs a contextualized HTML `coords` attribute.

Supported elements: `area`

-}
coords : String -> Attribute ctx msg
coords val =
    property "coords" (Json.string val)


{-| Constructs a contextualized HTML `crossorigin` attribute.

Supported elements: `audio`, `img`, `link`, `script`, `video`

> **_NOTE:_** The HTML `script` element is omitted in this package due to incompatibility with Elm.

-}
crossorigin : String -> Attribute ctx msg
crossorigin val =
    property "crossOrigin" (Json.string val)


{-| Constructs a contextualized HTML `data` attribute.

Supported elements: `object`

-}
data : String -> Attribute ctx msg
data val =
    property "data" (Json.string val)


{-| Constructs a contextualized HTML `datetime` attribute.

Supported elements: `del`, `ins`, `time`

-}
datetime : String -> Attribute ctx msg
datetime val =
    property "dateTime" (Json.string val)


{-| Constructs a contextualized HTML `decoding` attribute.

Supported elements: `img`

-}
decoding : String -> Attribute ctx msg
decoding val =
    property "decoding" (Json.string val)


{-| Constructs a contextualized HTML `default` attribute.

Supported elements: `track`

-}
default : Bool -> Attribute ctx msg
default val =
    property "default" (Json.bool val)


{-| Constructs a contextualized HTML `dir` attribute.

Supported elements: _HTML elements_

-}
dir : String -> Attribute ctx msg
dir val =
    property "dir" (Json.string val)


{-| Constructs a contextualized HTML `dirname` attribute.

Supported elements: `input`, `textarea`

-}
dirname : String -> Attribute ctx msg
dirname val =
    property "dirName" (Json.string val)


{-| Constructs a contextualized HTML `disabled` attribute.

Supported elements: `button`, `fieldset`, `input`, `link`, `optgroup`, `option`, `select`, `textarea`, _form-associated custom elements_

-}
disabled : Bool -> Attribute ctx msg
disabled val =
    property "disabled" (Json.bool val)


{-| Constructs a contextualized HTML `download` attribute.

Supported elements: `a`, `area`

-}
download : String -> Attribute ctx msg
download val =
    property "download" (Json.string val)


{-| Constructs a contextualized HTML `draggable` attribute.

Supported elements: _HTML elements_

-}
draggable : Bool -> Attribute ctx msg
draggable val =
    property "draggable" (Json.bool val)


{-| Constructs a contextualized HTML `enctype` attribute.

Supported elements: `form`

-}
enctype : String -> Attribute ctx msg
enctype val =
    property "enctype" (Json.string val)


{-| Constructs a contextualized HTML `enterkeyhint` attribute.

Supported elements: _HTML elements_

-}
enterkeyhint : String -> Attribute ctx msg
enterkeyhint val =
    property "enterKeyHint" (Json.string val)


{-| Constructs a contextualized HTML `fetchpriority` attribute.

Supported elements: `img`, `link`, `script`

> **_NOTE:_** The HTML `script` element is omitted in this package due to incompatibility with Elm.

-}
fetchpriority : String -> Attribute ctx msg
fetchpriority val =
    property "fetchPriority" (Json.string val)


{-| Constructs a contextualized HTML `for` attribute.

Supported elements: `label`, `output`

-}
for : String -> Attribute ctx msg
for val =
    property "htmlFor" (Json.string val)


{-| Constructs a contextualized HTML `form` attribute.

Supported elements: `button`, `fieldset`, `input`, `object`, `output`, `select`, `textarea`, _form-associated custom elements_

-}
form : String -> Attribute ctx msg
form val =
    attribute "form" val


{-| Constructs a contextualized HTML `formaction` attribute.

Supported elements: `button`, `input`

-}
formaction : String -> Attribute ctx msg
formaction val =
    property "formAction" (Json.string val)


{-| Constructs a contextualized HTML `formenctype` attribute.

Supported elements: `button`, `input`

-}
formenctype : String -> Attribute ctx msg
formenctype val =
    property "formEnctype" (Json.string val)


{-| Constructs a contextualized HTML `formmethod` attribute.

Supported elements: `button`, `input`

-}
formmethod : String -> Attribute ctx msg
formmethod val =
    property "formMethod" (Json.string val)


{-| Constructs a contextualized HTML `formnovalidate` attribute.

Supported elements: `button`, `input`

-}
formnovalidate : Bool -> Attribute ctx msg
formnovalidate val =
    property "formNoValidate" (Json.bool val)


{-| Constructs a contextualized HTML `formtarget` attribute.

Supported elements: `button`, `input`

-}
formtarget : String -> Attribute ctx msg
formtarget val =
    property "formTarget" (Json.string val)


{-| Constructs a contextualized HTML `headers` attribute.

Supported elements: `td`, `th`

-}
headers : String -> Attribute ctx msg
headers val =
    property "headers" (Json.string val)


{-| Constructs a contextualized HTML `height` attribute.

Supported elements: `canvas`, `embed`, `iframe`, `img`, `input`, `object`, `source`, `video`

-}
height : Int -> Attribute ctx msg
height val =
    property "height" (Json.int val)


{-| Constructs a contextualized HTML `hidden` attribute.

Supported elements: _HTML elements_

-}
hidden : Bool -> Attribute ctx msg
hidden val =
    property "hidden" (Json.bool val)


{-| Constructs a contextualized HTML `high` attribute.

Supported elements: `meter`

-}
high : Float -> Attribute ctx msg
high val =
    property "high" (Json.float val)


{-| Constructs a contextualized HTML `href` attribute.

Supported elements: `a`, `area`, `base`, `link`

-}
href : String -> Attribute ctx msg
href val =
    property "href" (Json.string val)


{-| Constructs a contextualized HTML `hreflang` attribute.

Supported elements: `a`, `link`

-}
hreflang : String -> Attribute ctx msg
hreflang val =
    property "hreflang" (Json.string val)


{-| Constructs a contextualized HTML `http-equiv` attribute.

Supported elements: `meta`

-}
httpEquiv : String -> Attribute ctx msg
httpEquiv val =
    property "httpEquiv" (Json.string val)


{-| Constructs a contextualized HTML `id` attribute.

Supported elements: _HTML elements_

-}
id : String -> Attribute ctx msg
id val =
    property "id" (Json.string val)


{-| Constructs a contextualized HTML `imagesizes` attribute.

Supported elements: `link`

-}
imagesizes : String -> Attribute ctx msg
imagesizes val =
    property "imageSizes" (Json.string val)


{-| Constructs a contextualized HTML `imagesrcset` attribute.

Supported elements: `link`

-}
imagesrcset : String -> Attribute ctx msg
imagesrcset val =
    property "imageSrcset" (Json.string val)


{-| Constructs a contextualized HTML `inert` attribute.

Supported elements: _HTML elements_

-}
inert : Bool -> Attribute ctx msg
inert val =
    property "inert" (Json.bool val)


{-| Constructs a contextualized HTML `inputmode` attribute.

Supported elements: _HTML elements_

-}
inputmode : String -> Attribute ctx msg
inputmode val =
    property "inputMode" (Json.string val)


{-| Constructs a contextualized HTML `integrity` attribute.

Supported elements: `link`, `script`

> **_NOTE:_** The HTML `script` element is omitted in this package due to incompatibility with Elm.

-}
integrity : String -> Attribute ctx msg
integrity val =
    property "integrity" (Json.string val)


{-| Constructs a contextualized HTML `is` attribute.

Supported elements: _HTML elements_

-}
is : String -> Attribute ctx msg
is val =
    attribute "is" val


{-| Constructs a contextualized HTML `ismap` attribute.

Supported elements: `img`

-}
ismap : Bool -> Attribute ctx msg
ismap val =
    property "isMap" (Json.bool val)


{-| Constructs a contextualized HTML `itemid` attribute.

Supported elements: _HTML elements_

-}
itemid : String -> Attribute ctx msg
itemid val =
    attribute "itemid" val


{-| Constructs a contextualized HTML `itemprop` attribute.

Supported elements: _HTML elements_

-}
itemprop : String -> Attribute ctx msg
itemprop val =
    attribute "itemprop" val


{-| Constructs a contextualized HTML `itemref` attribute.

Supported elements: _HTML elements_

-}
itemref : String -> Attribute ctx msg
itemref val =
    attribute "itemref" val


{-| Constructs a contextualized HTML `itemscope` attribute.

Supported elements: _HTML elements_

-}
itemscope : String -> Attribute ctx msg
itemscope val =
    attribute "itemscope" val


{-| Constructs a contextualized HTML `itemtype` attribute.

Supported elements: _HTML elements_

-}
itemtype : String -> Attribute ctx msg
itemtype val =
    attribute "itemtype" val


{-| Constructs a contextualized HTML `kind` attribute.

Supported elements: `track`

-}
kind : String -> Attribute ctx msg
kind val =
    property "kind" (Json.string val)


{-| Constructs a contextualized HTML `label` attribute.

Supported elements: `optgroup`, `option`, `track`

-}
label : String -> Attribute ctx msg
label val =
    property "label" (Json.string val)


{-| Constructs a contextualized HTML `lang` attribute.

Supported elements: _HTML elements_

-}
lang : String -> Attribute ctx msg
lang val =
    property "lang" (Json.string val)


{-| Constructs a contextualized HTML `list` attribute.

Supported elements: `input`

-}
list : String -> Attribute ctx msg
list val =
    attribute "list" val


{-| Constructs a contextualized HTML `loading` attribute.

Supported elements: `iframe`, `img`

-}
loading : String -> Attribute ctx msg
loading val =
    property "loading" (Json.string val)


{-| Constructs a contextualized HTML `loop` attribute.

Supported elements: `audio`, `video`

-}
loop : Bool -> Attribute ctx msg
loop val =
    property "loop" (Json.bool val)


{-| Constructs a contextualized HTML `low` attribute.

Supported elements: `meter`

-}
low : Float -> Attribute ctx msg
low val =
    property "low" (Json.float val)


{-| Constructs a contextualized HTML `max` attribute.

Supported elements: `input`, `meter`, `progress`

-}
max : String -> Attribute ctx msg
max val =
    property "max" (Json.string val)


{-| Constructs a contextualized HTML `maxlength` attribute.

Supported elements: `input`, `textarea`

-}
maxlength : Int -> Attribute ctx msg
maxlength val =
    property "maxLength" (Json.int val)


{-| Constructs a contextualized HTML `media` attribute.

Supported elements: `link`, `meta`, `source`, `style`

-}
media : String -> Attribute ctx msg
media val =
    property "media" (Json.string val)


{-| Constructs a contextualized HTML `method` attribute.

Supported elements: `form`

-}
method : String -> Attribute ctx msg
method val =
    property "method" (Json.string val)


{-| Constructs a contextualized HTML `min` attribute.

Supported elements: `input`, `meter`

-}
min : Float -> Attribute ctx msg
min val =
    property "min" (Json.float val)


{-| Constructs a contextualized HTML `minlength` attribute.

Supported elements: `input`, `textarea`

-}
minlength : Int -> Attribute ctx msg
minlength val =
    property "minLength" (Json.int val)


{-| Constructs a contextualized HTML `multiple` attribute.

Supported elements: `input`, `select`

-}
multiple : Bool -> Attribute ctx msg
multiple val =
    property "multiple" (Json.bool val)


{-| Constructs a contextualized HTML `muted` attribute.

Supported elements: `audio`, `video`

-}
muted : Bool -> Attribute ctx msg
muted val =
    property "muted" (Json.bool val)


{-| Constructs a contextualized HTML `name` attribute.

Supported elements: `button`, `details`, `fieldset`, `form`, `iframe`, `input`, `map`, `object`, `output`, `select`, `slot`, `textarea`, _form-associated custom elements_

-}
name : String -> Attribute ctx msg
name val =
    property "name" (Json.string val)


{-| Constructs a contextualized HTML `nonce` attribute.

Supported elements: _HTML elements_

-}
nonce : String -> Attribute ctx msg
nonce val =
    property "nonce" (Json.string val)


{-| Constructs a contextualized HTML `novalidate` attribute.

Supported elements: `form`

-}
novalidate : Bool -> Attribute ctx msg
novalidate val =
    property "noValidate" (Json.bool val)


{-| Constructs a contextualized HTML `open` attribute.

Supported elements: `details`, `dialog`

-}
open : Bool -> Attribute ctx msg
open val =
    property "open" (Json.bool val)


{-| Constructs a contextualized HTML `optimum` attribute.

Supported elements: `meter`

-}
optimum : Float -> Attribute ctx msg
optimum val =
    property "optimum" (Json.float val)


{-| Constructs a contextualized HTML `pattern` attribute.

Supported elements: `input`

-}
pattern : String -> Attribute ctx msg
pattern val =
    property "pattern" (Json.string val)


{-| Constructs a contextualized HTML `ping` attribute.

Supported elements: `a`, `area`

-}
ping : String -> Attribute ctx msg
ping val =
    property "ping" (Json.string val)


{-| Constructs a contextualized HTML `placeholder` attribute.

Supported elements: `input`, `textarea`

-}
placeholder : String -> Attribute ctx msg
placeholder val =
    property "placeholder" (Json.string val)


{-| Constructs a contextualized HTML `playsinline` attribute.

Supported elements: `video`

-}
playsinline : Bool -> Attribute ctx msg
playsinline val =
    property "playsInline" (Json.bool val)


{-| Constructs a contextualized HTML `popover` attribute.

Supported elements: _HTML elements_

-}
popover : String -> Attribute ctx msg
popover val =
    property "popover" (Json.string val)


{-| Constructs a contextualized HTML `popovertarget` attribute.

Supported elements: `button`, `input`

-}
popovertarget : String -> Attribute ctx msg
popovertarget val =
    property "popoverTarget" (Json.string val)


{-| Constructs a contextualized HTML `popovertargetaction` attribute.

Supported elements: `button`, `input`

-}
popovertargetaction : String -> Attribute ctx msg
popovertargetaction val =
    property "popoverTargetAction" (Json.string val)


{-| Constructs a contextualized HTML `poster` attribute.

Supported elements: `video`

-}
poster : String -> Attribute ctx msg
poster val =
    property "poster" (Json.string val)


{-| Constructs a contextualized HTML `preload` attribute.

Supported elements: `audio`, `video`

-}
preload : String -> Attribute ctx msg
preload val =
    property "preload" (Json.string val)


{-| Constructs a contextualized HTML `readonly` attribute.

Supported elements: `input`, `textarea`, _form-associated custom elements_

-}
readonly : Bool -> Attribute ctx msg
readonly val =
    property "readOnly" (Json.bool val)


{-| Constructs a contextualized HTML `referrerpolicy` attribute.

Supported elements: `a`, `area`, `iframe`, `img`, `link`, `script`

> **_NOTE:_** The HTML `script` element is omitted in this package due to incompatibility with Elm.

-}
referrerpolicy : String -> Attribute ctx msg
referrerpolicy val =
    property "referrerPolicy" (Json.string val)


{-| Constructs a contextualized HTML `rel` attribute.

Supported elements: `a`, `area`, `link`

-}
rel : String -> Attribute ctx msg
rel val =
    property "rel" (Json.string val)


{-| Constructs a contextualized HTML `required` attribute.

Supported elements: `input`, `select`, `textarea`

-}
required : Bool -> Attribute ctx msg
required val =
    property "required" (Json.bool val)


{-| Constructs a contextualized HTML `reversed` attribute.

Supported elements: `ol`

-}
reversed : Bool -> Attribute ctx msg
reversed val =
    property "reversed" (Json.bool val)


{-| Constructs a contextualized HTML `rows` attribute.

Supported elements: `textarea`

-}
rows : Int -> Attribute ctx msg
rows val =
    property "rows" (Json.int val)


{-| Constructs a contextualized HTML `rowspan` attribute.

Supported elements: `td`, `th`

-}
rowspan : Int -> Attribute ctx msg
rowspan val =
    property "rowSpan" (Json.int val)


{-| Constructs a contextualized HTML `sandbox` attribute.

Supported elements: `iframe`

-}
sandbox : String -> Attribute ctx msg
sandbox val =
    property "sandbox" (Json.string val)


{-| Constructs a contextualized HTML `scope` attribute.

Supported elements: `th`

-}
scope : String -> Attribute ctx msg
scope val =
    property "scope" (Json.string val)


{-| Constructs a contextualized HTML `selected` attribute.

Supported elements: `option`

-}
selected : Bool -> Attribute ctx msg
selected val =
    property "selected" (Json.bool val)


{-| Constructs a contextualized HTML `shadowrootclonable` attribute.

Supported elements: `template`

-}
shadowrootclonable : Bool -> Attribute ctx msg
shadowrootclonable val =
    property "shadowRootClonable" (Json.bool val)


{-| Constructs a contextualized HTML `shadowrootdelegatesfocus` attribute.

Supported elements: `template`

-}
shadowrootdelegatesfocus : Bool -> Attribute ctx msg
shadowrootdelegatesfocus val =
    property "shadowRootDelegatesFocus" (Json.bool val)


{-| Constructs a contextualized HTML `shadowrootmode` attribute.

Supported elements: `template`

-}
shadowrootmode : String -> Attribute ctx msg
shadowrootmode val =
    property "shadowRootMode" (Json.string val)


{-| Constructs a contextualized HTML `shadowrootserializable` attribute.

Supported elements: `template`

-}
shadowrootserializable : Bool -> Attribute ctx msg
shadowrootserializable val =
    property "shadowRootSerializable" (Json.bool val)


{-| Constructs a contextualized HTML `shape` attribute.

Supported elements: `area`

-}
shape : String -> Attribute ctx msg
shape val =
    property "shape" (Json.string val)


{-| Constructs a contextualized HTML `size` attribute.

Supported elements: `input`, `select`

-}
size : Int -> Attribute ctx msg
size val =
    property "size" (Json.int val)


{-| Constructs a contextualized HTML `sizes` attribute.

Supported elements: `link`

-}
sizes : String -> Attribute ctx msg
sizes val =
    property "sizes" (Json.string val)


{-| Constructs a contextualized HTML `slot` attribute.

Supported elements: _HTML elements_

-}
slot : String -> Attribute ctx msg
slot val =
    property "slot" (Json.string val)


{-| Constructs a contextualized HTML `span` attribute.

Supported elements: `col`, `colgroup`

-}
span : Int -> Attribute ctx msg
span val =
    property "span" (Json.int val)


{-| Constructs a contextualized HTML `spellcheck` attribute.

Supported elements: _HTML elements_

-}
spellcheck : Bool -> Attribute ctx msg
spellcheck val =
    property "spellcheck" (Json.bool val)


{-| Constructs a contextualized HTML `src` attribute.

Supported elements: `audio`, `embed`, `iframe`, `img`, `input`, `script`, `source`, `track`, `video`

> **_NOTE:_** The HTML `script` element is omitted in this package due to incompatibility with Elm.

-}
src : String -> Attribute ctx msg
src val =
    property "src" (Json.string val)


{-| Constructs a contextualized HTML `srcdoc` attribute.

Supported elements: `iframe`

-}
srcdoc : String -> Attribute ctx msg
srcdoc val =
    property "srcdoc" (Json.string val)


{-| Constructs a contextualized HTML `srclang` attribute.

Supported elements: `track`

-}
srclang : String -> Attribute ctx msg
srclang val =
    property "srclang" (Json.string val)


{-| Constructs a contextualized HTML `srcset` attribute.

Supported elements: `img`, `source`

-}
srcset : String -> Attribute ctx msg
srcset val =
    property "srcset" (Json.string val)


{-| Constructs a contextualized HTML `start` attribute.

Supported elements: `ol`

-}
start : Int -> Attribute ctx msg
start val =
    property "start" (Json.int val)


{-| Constructs a contextualized HTML `step` attribute.

Supported elements: `input`

-}
step : String -> Attribute ctx msg
step val =
    property "step" (Json.string val)


{-| Constructs a contextualized HTML `style` attribute.

Supported elements: _HTML elements_

-}
style : String -> Attribute ctx msg
style val =
    property "style" (Json.string val)


{-| Constructs a contextualized HTML `tabindex` attribute.

Supported elements: _HTML elements_

-}
tabindex : Int -> Attribute ctx msg
tabindex val =
    property "tabIndex" (Json.int val)


{-| Constructs a contextualized HTML `target` attribute.

Supported elements: `a`, `area`, `base`, `form`

-}
target : String -> Attribute ctx msg
target val =
    property "target" (Json.string val)


{-| Constructs a contextualized HTML `title` attribute.

Supported elements: _HTML elements_

-}
title : String -> Attribute ctx msg
title val =
    property "title" (Json.string val)


{-| Constructs a contextualized HTML `translate` attribute.

Supported elements: _HTML elements_

-}
translate : Bool -> Attribute ctx msg
translate val =
    property "translate" (Json.bool val)


{-| Constructs a contextualized HTML `type` attribute.

Supported elements: `a`, `button`, `embed`, `input`, `link`, `object`, `ol`, `script`, `source`

> **_NOTE:_** The HTML `script` element is omitted in this package due to incompatibility with Elm.

-}
type_ : String -> Attribute ctx msg
type_ val =
    property "type" (Json.string val)


{-| Constructs a contextualized HTML `usemap` attribute.

Supported elements: `img`

-}
usemap : String -> Attribute ctx msg
usemap val =
    property "useMap" (Json.string val)


{-| Constructs a contextualized HTML `value` attribute.

Supported elements: `button`, `data`, `input`, `li`, `meter`, `option`, `progress`

-}
value : String -> Attribute ctx msg
value val =
    property "value" (Json.string val)


{-| Constructs a contextualized HTML `width` attribute.

Supported elements: `canvas`, `embed`, `iframe`, `img`, `input`, `object`, `source`, `video`

-}
width : Int -> Attribute ctx msg
width val =
    property "width" (Json.int val)


{-| Constructs a contextualized HTML `wrap` attribute.

Supported elements: `textarea`

-}
wrap : String -> Attribute ctx msg
wrap val =
    property "wrap" (Json.string val)


{-| Constructs a contextualized HTML `writingsuggestions` attribute.

Supported elements: _HTML elements_

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
