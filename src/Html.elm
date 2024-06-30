module Html exposing
    ( Html, Attribute
    , contextualize, decontextualize
    , using
    , mapElement
    , parentElement, leafElement
    , text
    , a, abbr, address, area, article, aside, audio, b, base, bdi, bdo, blockquote, body, br, button, canvas, caption, cite, code, col, colgroup, data, datalist, dd, del, details, dfn, dialog, div, dl, dt, em, embed, fieldset, figcaption, figure, footer, form, h1, h2, h3, h4, h5, h6, head, header, hgroup, hr, html, i, iframe, img, input, ins, kbd, label, legend, li, link, main_, map, mark, menu, meta, meter, nav, noscript, object, ol, optgroup, option, output, p, picture, pre, progress, q, rp, rt, ruby, s, samp, script, section, select, slot, small, source, span, strong, style, sub, summary, sup, table, tbody, td, template, textarea, tfoot, th, thead, time, title, tr, track, u, ul, var, video, wbr
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

#docs a, abbr, address, area, article, aside, audio, b, base, bdi, bdo, blockquote, body, br, button, canvas, caption, cite, code, col, colgroup, data, datalist, dd, del, details, dfn, dialog, div, dl, dt, em, embed, fieldset, figcaption, figure, footer, form, h1, h2, h3, h4, h5, h6, head, header, hgroup, hr, html, i, iframe, img, input, ins, kbd, label, legend, li, link, main\_, map, mark, menu, meta, meter, nav, noscript, object, ol, optgroup, option, output, p, picture, pre, progress, q, rp, rt, ruby, s, samp, script, section, select, slot, small, source, span, strong, style, sub, summary, sup, table, tbody, td, template, textarea, tfoot, th, thead, time, title, tr, track, u, ul, var, video, wbr

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
mapElement f content =
    Internal.Html <|
        \ctx ->
            VirtualDom.map f (Internal.decontextualizeHtml ctx content)



-- CUSTOM ELEMENTS


{-| Constructs a contextualized HTML parent element.
-}
parentElement : String -> List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
parentElement name attributes children =
    Internal.Html <|
        \ctx ->
            VirtualDom.node
                name
                (List.map (Internal.decontextualizeAttribute ctx) attributes)
                (List.map (Internal.decontextualizeHtml ctx) children)


{-| Constructs a contextualized HTML leaf element.
-}
leafElement : String -> List (Attribute ctx msg) -> Html ctx msg
leafElement name attributes =
    Internal.Html <|
        \ctx ->
            VirtualDom.node
                name
                (List.map (Internal.decontextualizeAttribute ctx) attributes)
                []



-- TEXT


{-| Constructs a contextualized HTML text node.
-}
text : String -> Html ctx msg
text content =
    Internal.Html <|
        \_ -> VirtualDom.text content



-- STANDARD ELEMENTS


{-| Constructs contextualized HTML `a` element.
-}
a : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
a =
    parentElement "a"


{-| Constructs a contextualized HTML `abbr` element.
-}
abbr : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
abbr =
    parentElement "abbr"


{-| Constructs a contextualized HTML `address` element.
-}
address : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
address =
    parentElement "address"


{-| Constructs a contextualized HTML `area` element.
-}
area : List (Attribute ctx msg) -> Html ctx msg
area =
    leafElement "area"


{-| Constructs a contextualized HTML `article` element.
-}
article : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
article =
    parentElement "article"


{-| Constructs a contextualized HTML `aside` element.
-}
aside : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
aside =
    parentElement "aside"


{-| Constructs a contextualized HTML `audio` element.
-}
audio : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
audio =
    parentElement "audio"


{-| Constructs a contextualized HTML `b` element.
-}
b : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
b =
    parentElement "b"


{-| Constructs a contextualized HTML `base` element.
-}
base : List (Attribute ctx msg) -> Html ctx msg
base =
    leafElement "base"


{-| Constructs a contextualized HTML `bdi` element.
-}
bdi : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
bdi =
    parentElement "bdi"


{-| Constructs a contextualized HTML `bdo` element.
-}
bdo : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
bdo =
    parentElement "bdo"


{-| Constructs a contextualized HTML `blockquote` element.
-}
blockquote : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
blockquote =
    parentElement "blockquote"


{-| Constructs a contextualized HTML `body` element.
-}
body : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
body =
    parentElement "body"


{-| Constructs a contextualized HTML `br` element.
-}
br : List (Attribute ctx msg) -> Html ctx msg
br =
    leafElement "br"


{-| Constructs a contextualized HTML `button` element.
-}
button : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
button =
    parentElement "button"


{-| Constructs a contextualized HTML `canvas` element.
-}
canvas : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
canvas =
    parentElement "canvas"


{-| Constructs a contextualized HTML `caption` element.
-}
caption : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
caption =
    parentElement "caption"


{-| Constructs a contextualized HTML `cite` element.
-}
cite : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
cite =
    parentElement "cite"


{-| Constructs a contextualized HTML `code` element.
-}
code : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
code =
    parentElement "code"


{-| Constructs a contextualized HTML `col` element.
-}
col : List (Attribute ctx msg) -> Html ctx msg
col =
    leafElement "col"


{-| Constructs a contextualized HTML `colgroup` element.
-}
colgroup : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
colgroup =
    parentElement "colgroup"


{-| Constructs a contextualized HTML `data` element.
-}
data : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
data =
    parentElement "data"


{-| Constructs a contextualized HTML `datalist` element.
-}
datalist : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
datalist =
    parentElement "datalist"


{-| Constructs a contextualized HTML `dd` element.
-}
dd : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
dd =
    parentElement "dd"


{-| Constructs a contextualized HTML `del` element.
-}
del : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
del =
    parentElement "del"


{-| Constructs a contextualized HTML `details` element.
-}
details : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
details =
    parentElement "details"


{-| Constructs a contextualized HTML `dfn` element.
-}
dfn : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
dfn =
    parentElement "dfn"


{-| Constructs a contextualized HTML `dialog` element.
-}
dialog : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
dialog =
    parentElement "dialog"


{-| Constructs a contextualized HTML `div` element.
-}
div : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
div =
    parentElement "div"


{-| Constructs a contextualized HTML `dl` element.
-}
dl : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
dl =
    parentElement "dl"


{-| Constructs a contextualized HTML `dt` element.
-}
dt : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
dt =
    parentElement "dt"


{-| Constructs a contextualized HTML `em` element.
-}
em : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
em =
    parentElement "em"


{-| Constructs a contextualized HTML `embed` element.
-}
embed : List (Attribute ctx msg) -> Html ctx msg
embed =
    leafElement "embed"


{-| Constructs a contextualized HTML `fieldset` element.
-}
fieldset : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
fieldset =
    parentElement "fieldset"


{-| Constructs a contextualized HTML `figcaption` element.
-}
figcaption : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
figcaption =
    parentElement "figcaption"


{-| Constructs a contextualized HTML `figure` element.
-}
figure : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
figure =
    parentElement "figure"


{-| Constructs a contextualized HTML `footer` element.
-}
footer : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
footer =
    parentElement "footer"


{-| Constructs a contextualized HTML `form` element.
-}
form : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
form =
    parentElement "form"


{-| Constructs a contextualized HTML `h1` element.
-}
h1 : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
h1 =
    parentElement "h1"


{-| Constructs a contextualized HTML `h2` element.
-}
h2 : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
h2 =
    parentElement "h2"


{-| Constructs a contextualized HTML `h3` element.
-}
h3 : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
h3 =
    parentElement "h3"


{-| Constructs a contextualized HTML `h4` element.
-}
h4 : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
h4 =
    parentElement "h4"


{-| Constructs a contextualized HTML `h5` element.
-}
h5 : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
h5 =
    parentElement "h5"


{-| Constructs a contextualized HTML `h6` element.
-}
h6 : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
h6 =
    parentElement "h6"


{-| Constructs a contextualized HTML `head` element.
-}
head : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
head =
    parentElement "head"


{-| Constructs a contextualized HTML `header` element.
-}
header : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
header =
    parentElement "header"


{-| Constructs a contextualized HTML `hgroup` element.
-}
hgroup : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
hgroup =
    parentElement "hgroup"


{-| Constructs a contextualized HTML `hr` element.
-}
hr : List (Attribute ctx msg) -> Html ctx msg
hr =
    leafElement "hr"


{-| Constructs a contextualized HTML `html` element.
-}
html : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
html =
    parentElement "html"


{-| Constructs a contextualized HTML `i` element.
-}
i : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
i =
    parentElement "i"


{-| Constructs a contextualized HTML `iframe` element.
-}
iframe : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
iframe =
    parentElement "iframe"


{-| Constructs a contextualized HTML `img` element.
-}
img : List (Attribute ctx msg) -> Html ctx msg
img =
    leafElement "img"


{-| Constructs a contextualized HTML `input` element.
-}
input : List (Attribute ctx msg) -> Html ctx msg
input =
    leafElement "input"


{-| Constructs a contextualized HTML `ins` element.
-}
ins : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
ins =
    parentElement "ins"


{-| Constructs a contextualized HTML `kbd` element.
-}
kbd : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
kbd =
    parentElement "kbd"


{-| Constructs a contextualized HTML `label` element.
-}
label : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
label =
    parentElement "label"


{-| Constructs a contextualized HTML `legend` element.
-}
legend : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
legend =
    parentElement "legend"


{-| Constructs a contextualized HTML `li` element.
-}
li : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
li =
    parentElement "li"


{-| Constructs a contextualized HTML `link` element.
-}
link : List (Attribute ctx msg) -> Html ctx msg
link =
    leafElement "link"


{-| Constructs a contextualized HTML `main` element.
-}
main_ : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
main_ =
    parentElement "main"


{-| Constructs a contextualized HTML `map` element.
-}
map : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
map =
    parentElement "map"


{-| Constructs a contextualized HTML `mark` element.
-}
mark : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
mark =
    parentElement "mark"


{-| Constructs a contextualized HTML `menu` element.
-}
menu : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
menu =
    parentElement "menu"


{-| Constructs a contextualized HTML `meta` element.
-}
meta : List (Attribute ctx msg) -> Html ctx msg
meta =
    leafElement "meta"


{-| Constructs a contextualized HTML `meter` element.
-}
meter : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
meter =
    parentElement "meter"


{-| Constructs a contextualized HTML `nav` element.
-}
nav : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
nav =
    parentElement "nav"


{-| Constructs a contextualized HTML `noscript` element.
-}
noscript : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
noscript =
    parentElement "noscript"


{-| Constructs a contextualized HTML `object` element.
-}
object : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
object =
    parentElement "object"


{-| Constructs a contextualized HTML `ol` element.
-}
ol : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
ol =
    parentElement "ol"


{-| Constructs a contextualized HTML `optgroup` element.
-}
optgroup : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
optgroup =
    parentElement "optgroup"


{-| Constructs a contextualized HTML `option` element.
-}
option : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
option =
    parentElement "option"


{-| Constructs a contextualized HTML `output` element.
-}
output : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
output =
    parentElement "output"


{-| Constructs a contextualized HTML `p` element.
-}
p : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
p =
    parentElement "p"


{-| Constructs a contextualized HTML `picture` element.
-}
picture : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
picture =
    parentElement "picture"


{-| Constructs a contextualized HTML `pre` element.
-}
pre : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
pre =
    parentElement "pre"


{-| Constructs a contextualized HTML `progress` element.
-}
progress : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
progress =
    parentElement "progress"


{-| Constructs a contextualized HTML `q` element.
-}
q : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
q =
    parentElement "q"


{-| Constructs a contextualized HTML `rp` element.
-}
rp : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
rp =
    parentElement "rp"


{-| Constructs a contextualized HTML `rt` element.
-}
rt : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
rt =
    parentElement "rt"


{-| Constructs a contextualized HTML `ruby` element.
-}
ruby : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
ruby =
    parentElement "ruby"


{-| Constructs a contextualized HTML `s` element.
-}
s : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
s =
    parentElement "s"


{-| Constructs a contextualized HTML `samp` element.
-}
samp : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
samp =
    parentElement "samp"


{-| Constructs a contextualized HTML `script` element.
-}
script : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
script =
    parentElement "script"


{-| Constructs a contextualized HTML `section` element.
-}
section : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
section =
    parentElement "section"


{-| Constructs a contextualized HTML `select` element.
-}
select : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
select =
    parentElement "select"


{-| Constructs a contextualized HTML `slot` element.
-}
slot : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
slot =
    parentElement "slot"


{-| Constructs a contextualized HTML `small` element.
-}
small : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
small =
    parentElement "small"


{-| Constructs a contextualized HTML `source` element.
-}
source : List (Attribute ctx msg) -> Html ctx msg
source =
    leafElement "source"


{-| Constructs a contextualized HTML `span` element.
-}
span : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
span =
    parentElement "span"


{-| Constructs a contextualized HTML `strong` element.
-}
strong : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
strong =
    parentElement "strong"


{-| Constructs a contextualized HTML `style` element.
-}
style : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
style =
    parentElement "style"


{-| Constructs a contextualized HTML `sub` element.
-}
sub : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
sub =
    parentElement "sub"


{-| Constructs a contextualized HTML `summary` element.
-}
summary : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
summary =
    parentElement "summary"


{-| Constructs a contextualized HTML `sup` element.
-}
sup : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
sup =
    parentElement "sup"


{-| Constructs a contextualized HTML `table` element.
-}
table : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
table =
    parentElement "table"


{-| Constructs a contextualized HTML `tbody` element.
-}
tbody : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
tbody =
    parentElement "tbody"


{-| Constructs a contextualized HTML `td` element.
-}
td : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
td =
    parentElement "td"


{-| Constructs a contextualized HTML `template` element.
-}
template : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
template =
    parentElement "template"


{-| Constructs a contextualized HTML `textarea` element.
-}
textarea : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
textarea =
    parentElement "textarea"


{-| Constructs a contextualized HTML `tfoot` element.
-}
tfoot : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
tfoot =
    parentElement "tfoot"


{-| Constructs a contextualized HTML `th` element.
-}
th : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
th =
    parentElement "th"


{-| Constructs a contextualized HTML `thead` element.
-}
thead : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
thead =
    parentElement "thead"


{-| Constructs a contextualized HTML `time` element.
-}
time : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
time =
    parentElement "time"


{-| Constructs a contextualized HTML `title` element.
-}
title : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
title =
    parentElement "title"


{-| Constructs a contextualized HTML `tr` element.
-}
tr : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
tr =
    parentElement "tr"


{-| Constructs a contextualized HTML `track` element.
-}
track : List (Attribute ctx msg) -> Html ctx msg
track =
    leafElement "track"


{-| Constructs a contextualized HTML `u` element.
-}
u : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
u =
    parentElement "u"


{-| Constructs a contextualized HTML `ul` element.
-}
ul : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
ul =
    parentElement "ul"


{-| Constructs a contextualized HTML `var` element.
-}
var : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
var =
    parentElement "var"


{-| Constructs a contextualized HTML `video` element.
-}
video : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
video =
    parentElement "video"


{-| Constructs a contextualized HTML `wbr` element.
-}
wbr : List (Attribute ctx msg) -> Html ctx msg
wbr =
    leafElement "wbr"
