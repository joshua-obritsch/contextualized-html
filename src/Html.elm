module Html exposing
    ( Html, Attribute
    , contextualize, decontextualize
    , using
    , mapElement
    , parentElement, leafElement
    , text
    , a, abbr, address, area, article, aside, audio, b, base, bdi, bdo, blockquote, body, br, button, canvas, caption, cite, code, col, colgroup, data, datalist, dd, del, details, dfn, dialog, div, dl, dt, em, embed, fieldset, figcaption, figure, footer, form, h1, h2, h3, h4, h5, h6, head, header, hgroup, hr, html, i, iframe, img, input, ins, kbd, label, legend, li, link, main_, map, mark, menu, meta, meter, nav, noscript, object, ol, optgroup, option, output, p, picture, pre, progress, q, rp, rt, ruby, s, samp, search, section, select, slot, small, source, span, strong, style, sub, summary, sup, table, tbody, td, template, textarea, tfoot, th, thead, time, title, tr, track, u, ul, var, video, wbr
    )

{-| This module provides a set of types and functions for generating context-dependent HTML elements.


# Primitives

@docs Html, Attribute


# Contextual Conversion

@docs contextualize, decontextualize


# Contextual Dependency

@docs using


# Transformations

@docs mapElement


# Custom Elements

@docs parentElement, leafElement


# Text

@docs text


# Standard Elements

#docs a, abbr, address, area, article, aside, audio, b, base, bdi, bdo, blockquote, body, br, button, canvas, caption, cite, code, col, colgroup, data, datalist, dd, del, details, dfn, dialog, div, dl, dt, em, embed, fieldset, figcaption, figure, footer, form, h1, h2, h3, h4, h5, h6, head, header, hgroup, hr, html, i, iframe, img, input, ins, kbd, label, legend, li, link, main\_, map, mark, menu, meta, meter, nav, noscript, object, ol, optgroup, option, output, p, picture, pre, progress, q, rp, rt, ruby, s, samp, section, search, select, slot, small, source, span, strong, style, sub, summary, sup, table, tbody, td, template, textarea, tfoot, th, thead, time, title, tr, track, u, ul, var, video, wbr

-}

import Html.Internal as Internal
import VirtualDom



-- PRIMITIVES


{-| Represents an HTML element encompassing a context (`ctx`) and message (`msg`), also known as a contextualized HTML element.
-}
type alias Html ctx msg =
    Internal.Html ctx msg


{-| Represents an HTML attribute encompassing a context (`ctx`) and message (`msg`), also known as a contextualized HTML attribute.
-}
type alias Attribute ctx msg =
    Internal.Attribute ctx msg



-- CONTEXTUAL CONVERSION


{-| Converts a decontextualized virtual DOM node into a contextualized HTML element.
-}
contextualize : VirtualDom.Node msg -> Html ctx msg
contextualize =
    Internal.contextualizeHtml


{-| Converts a contextualized HTML element into a decontextualized virtual DOM node.
-}
decontextualize : ctx -> Html ctx msg -> VirtualDom.Node msg
decontextualize =
    Internal.decontextualizeHtml



-- CONTEXTUAL DEPENDENCY


{-| Establishes a dependency between a context and a contextualized HTML element.
-}
using : (ctx -> Html ctx msg) -> Html ctx msg
using =
    Internal.usingHtml



-- TRANSFORMATIONS


{-| Transforms the message of a contextualized HTML element.
-}
mapElement : (a -> b) -> Html ctx a -> Html ctx b
mapElement =
    Internal.mapElement



-- TEXT


{-| Constructs a contextualized HTML text node.
-}
text : String -> Html ctx msg
text =
    Internal.textNode



-- CUSTOM ELEMENTS


{-| Constructs a contextualized HTML parent element.
-}
parentElement : String -> List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
parentElement =
    Internal.parentElement


{-| Constructs a contextualized HTML leaf element.
-}
leafElement : String -> List (Attribute ctx msg) -> Html ctx msg
leafElement =
    Internal.leafElement



-- STANDARD ELEMENTS


{-| Constructs a contextualized HTML `a` element.

Supported attributes: _globals_, `download`, `href`, `hreflang`, `ping`, `referrerpolicy`, `rel`, `target`, `type`

-}
a : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
a =
    parentElement "a"


{-| Constructs a contextualized HTML `abbr` element.

Supported attributes: _globals_

-}
abbr : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
abbr =
    parentElement "abbr"


{-| Constructs a contextualized HTML `address` element.

Supported attributes: _globals_

-}
address : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
address =
    parentElement "address"


{-| Constructs a contextualized HTML `area` element.

Supported attributes: _globals_, `alt`, `coords`, `download`, `href`, `ping`, `referrerpolicy`, `rel`, `shape`, `target`

-}
area : List (Attribute ctx msg) -> Html ctx msg
area =
    leafElement "area"


{-| Constructs a contextualized HTML `article` element.

Supported attributes: _globals_

-}
article : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
article =
    parentElement "article"


{-| Constructs a contextualized HTML `aside` element.

Supported attributes: _globals_

-}
aside : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
aside =
    parentElement "aside"


{-| Constructs a contextualized HTML `audio` element.

Supported attributes: _globals_, `autoplay`, `controls`, `crossorigin`, `loop`, `muted`, `preload`, `src`

-}
audio : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
audio =
    parentElement "audio"


{-| Constructs a contextualized HTML `b` element.

Supported attributes: _globals_

-}
b : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
b =
    parentElement "b"


{-| Constructs a contextualized HTML `base` element.

Supported attributes: _globals_, `href`, `target`

-}
base : List (Attribute ctx msg) -> Html ctx msg
base =
    leafElement "base"


{-| Constructs a contextualized HTML `bdi` element.

Supported attributes: _globals_

-}
bdi : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
bdi =
    parentElement "bdi"


{-| Constructs a contextualized HTML `bdo` element.

Supported attributes: _globals_

-}
bdo : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
bdo =
    parentElement "bdo"


{-| Constructs a contextualized HTML `blockquote` element.

Supported attributes: _globals_, `cite`

-}
blockquote : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
blockquote =
    parentElement "blockquote"


{-| Constructs a contextualized HTML `body` element.

Supported attributes: _globals_

-}
body : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
body =
    parentElement "body"


{-| Constructs a contextualized HTML `br` element.

Supported attributes: _globals_

-}
br : List (Attribute ctx msg) -> Html ctx msg
br =
    leafElement "br"


{-| Constructs a contextualized HTML `button` element.

Supported attributes: _globals_, `disabled`, `form`, `formaction`, `formenctype`, `formmethod`, `formnovalidate`, `formtarget`, `name`, `popovertarget`, `popovertargetaction`, `type`, `value`

-}
button : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
button =
    parentElement "button"


{-| Constructs a contextualized HTML `canvas` element.

Supported attributes: _globals_, `height`, `width`

-}
canvas : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
canvas =
    parentElement "canvas"


{-| Constructs a contextualized HTML `caption` element.

Supported attributes: _globals_

-}
caption : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
caption =
    parentElement "caption"


{-| Constructs a contextualized HTML `cite` element.

Supported attributes: _globals_

-}
cite : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
cite =
    parentElement "cite"


{-| Constructs a contextualized HTML `code` element.

Supported attributes: _globals_

-}
code : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
code =
    parentElement "code"


{-| Constructs a contextualized HTML `col` element.

Supported attributes: _globals_, `span`

-}
col : List (Attribute ctx msg) -> Html ctx msg
col =
    leafElement "col"


{-| Constructs a contextualized HTML `colgroup` element.

Supported attributes: _globals_, `span`

-}
colgroup : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
colgroup =
    parentElement "colgroup"


{-| Constructs a contextualized HTML `data` element.

Supported attributes: _globals_, `value`

-}
data : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
data =
    parentElement "data"


{-| Constructs a contextualized HTML `datalist` element.

Supported attributes: _globals_

-}
datalist : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
datalist =
    parentElement "datalist"


{-| Constructs a contextualized HTML `dd` element.

Supported attributes: _globals_

-}
dd : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
dd =
    parentElement "dd"


{-| Constructs a contextualized HTML `del` element.

Supported attributes: _globals_, `cite`, `datetime`

-}
del : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
del =
    parentElement "del"


{-| Constructs a contextualized HTML `details` element.

Supported attributes: _globals_, `name`, `open`

-}
details : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
details =
    parentElement "details"


{-| Constructs a contextualized HTML `dfn` element.

Supported attributes: _globals_

-}
dfn : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
dfn =
    parentElement "dfn"


{-| Constructs a contextualized HTML `dialog` element.

Supported attributes: _globals_, `open`

-}
dialog : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
dialog =
    parentElement "dialog"


{-| Constructs a contextualized HTML `div` element.

Supported attributes: _globals_

-}
div : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
div =
    parentElement "div"


{-| Constructs a contextualized HTML `dl` element.

Supported attributes: _globals_

-}
dl : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
dl =
    parentElement "dl"


{-| Constructs a contextualized HTML `dt` element.

Supported attributes: _globals_

-}
dt : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
dt =
    parentElement "dt"


{-| Constructs a contextualized HTML `em` element.

Supported attributes: _globals_

-}
em : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
em =
    parentElement "em"


{-| Constructs a contextualized HTML `embed` element.

Supported attributes: _globals_, `height`, `src`, `type`, `width`

-}
embed : List (Attribute ctx msg) -> Html ctx msg
embed =
    leafElement "embed"


{-| Constructs a contextualized HTML `fieldset` element.

Supported attributes: _globals_, `disabled`, `form`, `name`

-}
fieldset : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
fieldset =
    parentElement "fieldset"


{-| Constructs a contextualized HTML `figcaption` element.

Supported attributes: _globals_

-}
figcaption : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
figcaption =
    parentElement "figcaption"


{-| Constructs a contextualized HTML `figure` element.

Supported attributes: _globals_

-}
figure : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
figure =
    parentElement "figure"


{-| Constructs a contextualized HTML `footer` element.

Supported attributes: _globals_

-}
footer : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
footer =
    parentElement "footer"


{-| Constructs a contextualized HTML `form` element.

Supported attributes: _globals_, `accept-charset`, `action`, `autocomplete`, `enctype`, `method`, `name`, `novalidate`, `rel`, `target`

-}
form : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
form =
    parentElement "form"


{-| Constructs a contextualized HTML `h1` element.

Supported attributes: _globals_

-}
h1 : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
h1 =
    parentElement "h1"


{-| Constructs a contextualized HTML `h2` element.

Supported attributes: _globals_

-}
h2 : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
h2 =
    parentElement "h2"


{-| Constructs a contextualized HTML `h3` element.

Supported attributes: _globals_

-}
h3 : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
h3 =
    parentElement "h3"


{-| Constructs a contextualized HTML `h4` element.

Supported attributes: _globals_

-}
h4 : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
h4 =
    parentElement "h4"


{-| Constructs a contextualized HTML `h5` element.

Supported attributes: _globals_

-}
h5 : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
h5 =
    parentElement "h5"


{-| Constructs a contextualized HTML `h6` element.

Supported attributes: _globals_

-}
h6 : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
h6 =
    parentElement "h6"


{-| Constructs a contextualized HTML `head` element.

Supported attributes: _globals_

-}
head : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
head =
    parentElement "head"


{-| Constructs a contextualized HTML `header` element.

Supported attributes: _globals_

-}
header : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
header =
    parentElement "header"


{-| Constructs a contextualized HTML `hgroup` element.

Supported attributes: _globals_

-}
hgroup : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
hgroup =
    parentElement "hgroup"


{-| Constructs a contextualized HTML `hr` element.

Supported attributes: _globals_

-}
hr : List (Attribute ctx msg) -> Html ctx msg
hr =
    leafElement "hr"


{-| Constructs a contextualized HTML `html` element.

Supported attributes: _globals_

-}
html : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
html =
    parentElement "html"


{-| Constructs a contextualized HTML `i` element.

Supported attributes: _globals_

-}
i : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
i =
    parentElement "i"


{-| Constructs a contextualized HTML `iframe` element.

Supported attributes: _globals_, `allow`, `allowfullscreen`, `height`, `loading`, `name`, `referrerpolicy`, `sandbox`, `src`, `srcdoc`, `width`

-}
iframe : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
iframe =
    parentElement "iframe"


{-| Constructs a contextualized HTML `img` element.

Supported attributes: _globals_, `alt`, `crossorigin`, `decoding`, `fetchpriority`, `height`, `ismap`, `loading`, `referrerpolicy`, `sizes`, `src`, `srcset`, `usemap`, `width`

-}
img : List (Attribute ctx msg) -> Html ctx msg
img =
    leafElement "img"


{-| Constructs a contextualized HTML `input` element.

Supported attributes: _globals_, `accept`, `alt`, `autocomplete`, `checked`, `dirname`, `disabled`, `form`, `formaction`, `formenctype`, `formmethod`, `formnovalidate`, `formtarget`, `height`, `list`, `max`, `maxlength`, `min`, `minlength`, `multiple`, `name`, `pattern`, `placeholder`, `popovertarget`, `popovertargetaction`, `readonly`, `required`, `size`, `src`, `step`, `type`, `value`, `width`

-}
input : List (Attribute ctx msg) -> Html ctx msg
input =
    leafElement "input"


{-| Constructs a contextualized HTML `ins` element.

Supported attributes: _globals_, `cite`, `datetime`

-}
ins : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
ins =
    parentElement "ins"


{-| Constructs a contextualized HTML `kbd` element.

Supported attributes: _globals_

-}
kbd : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
kbd =
    parentElement "kbd"


{-| Constructs a contextualized HTML `label` element.

Supported attributes: _globals_, `for`

-}
label : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
label =
    parentElement "label"


{-| Constructs a contextualized HTML `legend` element.

Supported attributes: _globals_

-}
legend : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
legend =
    parentElement "legend"


{-| Constructs a contextualized HTML `li` element.

Supported attributes: _globals_, `value`

-}
li : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
li =
    parentElement "li"


{-| Constructs a contextualized HTML `link` element.

Supported attributes: _globals_, `as`, `blocking`, `color`, `crossorigin`, `disabled`, `fetchpriority`, `href`, `hreflang`, `imagesizes`, `imagesrcset`, `integrity`, `media`, `referrerpolicy`, `rel`, `sizes`, `type`

-}
link : List (Attribute ctx msg) -> Html ctx msg
link =
    leafElement "link"


{-| Constructs a contextualized HTML `main` element.

Supported attributes: _globals_

-}
main_ : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
main_ =
    parentElement "main"


{-| Constructs a contextualized HTML `map` element.

Supported attributes: _globals_, `name`

-}
map : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
map =
    parentElement "map"


{-| Constructs a contextualized HTML `mark` element.

Supported attributes: _globals_

-}
mark : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
mark =
    parentElement "mark"


{-| Constructs a contextualized HTML `menu` element.

Supported attributes: _globals_

-}
menu : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
menu =
    parentElement "menu"


{-| Constructs a contextualized HTML `meta` element.

Supported attributes: _globals_, `charset`, `content`, `http-equiv`, `media`, `name`

-}
meta : List (Attribute ctx msg) -> Html ctx msg
meta =
    leafElement "meta"


{-| Constructs a contextualized HTML `meter` element.

Supported attributes: _globals_, `high`, `low`, `max`, `min`, `optimum`, `value`

-}
meter : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
meter =
    parentElement "meter"


{-| Constructs a contextualized HTML `nav` element.

Supported attributes: _globals_

-}
nav : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
nav =
    parentElement "nav"


{-| Constructs a contextualized HTML `noscript` element.

Supported attributes: _globals_

-}
noscript : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
noscript =
    parentElement "noscript"


{-| Constructs a contextualized HTML `object` element.

Supported attributes: _globals_, `data`, `form`, `height`, `name`, `type`, `width`

-}
object : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
object =
    parentElement "object"


{-| Constructs a contextualized HTML `ol` element.

Supported attributes: _globals_, `reversed`, `start`, `type`

-}
ol : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
ol =
    parentElement "ol"


{-| Constructs a contextualized HTML `optgroup` element.

Supported attributes: _globals_, `disabled`, `label`

-}
optgroup : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
optgroup =
    parentElement "optgroup"


{-| Constructs a contextualized HTML `option` element.

Supported attributes: _globals_, `disabled`, `label`, `selected`, `value`

-}
option : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
option =
    parentElement "option"


{-| Constructs a contextualized HTML `output` element.

Supported attributes: _globals_, `for`, `form`, `name`

-}
output : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
output =
    parentElement "output"


{-| Constructs a contextualized HTML `p` element.

Supported attributes: _globals_

-}
p : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
p =
    parentElement "p"


{-| Constructs a contextualized HTML `picture` element.

Supported attributes: _globals_

-}
picture : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
picture =
    parentElement "picture"


{-| Constructs a contextualized HTML `pre` element.

Supported attributes: _globals_

-}
pre : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
pre =
    parentElement "pre"


{-| Constructs a contextualized HTML `progress` element.

Supported attributes: _globals_, `max`, `value`

-}
progress : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
progress =
    parentElement "progress"


{-| Constructs a contextualized HTML `q` element.

Supported attributes: _globals_, `cite`

-}
q : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
q =
    parentElement "q"


{-| Constructs a contextualized HTML `rp` element.

Supported attributes: _globals_

-}
rp : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
rp =
    parentElement "rp"


{-| Constructs a contextualized HTML `rt` element.

Supported attributes: _globals_

-}
rt : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
rt =
    parentElement "rt"


{-| Constructs a contextualized HTML `ruby` element.

Supported attributes: _globals_

-}
ruby : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
ruby =
    parentElement "ruby"


{-| Constructs a contextualized HTML `s` element.

Supported attributes: _globals_

-}
s : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
s =
    parentElement "s"


{-| Constructs a contextualized HTML `samp` element.

Supported attributes: _globals_

-}
samp : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
samp =
    parentElement "samp"


{-| Constructs a contextualized HTML `search` element.

Supported attributes: _globals_

-}
search : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
search =
    parentElement "search"


{-| Constructs a contextualized HTML `section` element.

Supported attributes: _globals_

-}
section : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
section =
    parentElement "section"


{-| Constructs a contextualized HTML `select` element.

Supported attributes: _globals_, `autocomplete`, `disabled`, `form`, `multiple`, `name`, `required`, `size`

-}
select : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
select =
    parentElement "select"


{-| Constructs a contextualized HTML `slot` element.

Supported attributes: _globals_, `name`

-}
slot : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
slot =
    parentElement "slot"


{-| Constructs a contextualized HTML `small` element.

Supported attributes: _globals_

-}
small : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
small =
    parentElement "small"


{-| Constructs a contextualized HTML `source` element.

Supported attributes: _globals_, `height`, `media`, `sizes`, `src`, `srcset`, `type`, `width`

-}
source : List (Attribute ctx msg) -> Html ctx msg
source =
    leafElement "source"


{-| Constructs a contextualized HTML `span` element.

Supported attributes: _globals_

-}
span : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
span =
    parentElement "span"


{-| Constructs a contextualized HTML `strong` element.

Supported attributes: _globals_

-}
strong : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
strong =
    parentElement "strong"


{-| Constructs a contextualized HTML `style` element.

Supported attributes: _globals_, `blocking`, `media`

-}
style : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
style =
    parentElement "style"


{-| Constructs a contextualized HTML `sub` element.

Supported attributes: _globals_

-}
sub : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
sub =
    parentElement "sub"


{-| Constructs a contextualized HTML `summary` element.

Supported attributes: _globals_

-}
summary : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
summary =
    parentElement "summary"


{-| Constructs a contextualized HTML `sup` element.

Supported attributes: _globals_

-}
sup : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
sup =
    parentElement "sup"


{-| Constructs a contextualized HTML `table` element.

Supported attributes: _globals_

-}
table : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
table =
    parentElement "table"


{-| Constructs a contextualized HTML `tbody` element.

Supported attributes: _globals_

-}
tbody : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
tbody =
    parentElement "tbody"


{-| Constructs a contextualized HTML `td` element.

Supported attributes: _globals_, `colspan`, `headers`, `rowspan`

-}
td : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
td =
    parentElement "td"


{-| Constructs a contextualized HTML `template` element.

Supported attributes: _globals_, `shadowrootclonable`, `shadowrootdelegatesfocus`, `shadowrootmode`, `shadowrootserializable`

-}
template : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
template =
    parentElement "template"


{-| Constructs a contextualized HTML `textarea` element.

Supported attributes: _globals_, `audocomplete`, `cols`, `dirname`, `disabled`, `form`, `maxlength`, `minlength`, `name`, `placeholder`, `readonly`, `required`, `rows`, `wrap`

-}
textarea : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
textarea =
    parentElement "textarea"


{-| Constructs a contextualized HTML `tfoot` element.

Supported attributes: _globals_

-}
tfoot : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
tfoot =
    parentElement "tfoot"


{-| Constructs a contextualized HTML `th` element.

Supported attributes: _globals_, `abbr`, `colspan`, `headers`, `rowspan`, `scope`

-}
th : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
th =
    parentElement "th"


{-| Constructs a contextualized HTML `thead` element.

Supported attributes: _globals_

-}
thead : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
thead =
    parentElement "thead"


{-| Constructs a contextualized HTML `time` element.

Supported attributes: _globals_, `datetime`

-}
time : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
time =
    parentElement "time"


{-| Constructs a contextualized HTML `title` element.

Supported attributes: _globals_

-}
title : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
title =
    parentElement "title"


{-| Constructs a contextualized HTML `tr` element.

Supported attributes: _globals_

-}
tr : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
tr =
    parentElement "tr"


{-| Constructs a contextualized HTML `track` element.

Supported attributes: _globals_, `default`, `kind`, `label`, `src`, `srclang`

-}
track : List (Attribute ctx msg) -> Html ctx msg
track =
    leafElement "track"


{-| Constructs a contextualized HTML `u` element.

Supported attributes: _globals_

-}
u : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
u =
    parentElement "u"


{-| Constructs a contextualized HTML `ul` element.

Supported attributes: _globals_

-}
ul : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
ul =
    parentElement "ul"


{-| Constructs a contextualized HTML `var` element.

Supported attributes: _globals_

-}
var : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
var =
    parentElement "var"


{-| Constructs a contextualized HTML `video` element.

Supported attributes: _globals_, `autoplay`, `controls`, `crossorigin`, `height`, `loop`, `muted`, `playsinline`, `poster`, `preload`, `src`, `width`

-}
video : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
video =
    parentElement "video"


{-| Constructs a contextualized HTML `wbr` element.

Supported attributes: _globals_

-}
wbr : List (Attribute ctx msg) -> Html ctx msg
wbr =
    leafElement "wbr"
