module Html exposing
    ( Html(..)
    , contextualize, decontextualize, using
    , text
    , a, abbr, address, area, article, aside, audio, b, base, bdi, bdo, blockquote, body, br, button, canvas, caption, cite, code, col, colgroup, data, datalist, dd, del, details, dfn, dialog, div, dl, dt, em, embed, fieldset, figcaption, figure, footer, form, h1, h2, h3, h4, h5, h6, head, header, hgroup, hr, html, i, iframe, img, input, ins, kbd, label, legend, li, link, main_, map, mark, menu, meta, meter, nav, noscript, object, ol, optgroup, option, output, p, picture, pre, progress, q, rp, rt, ruby, s, samp, section, search, select, slot, small, source, span, strong, style, sub, summary, sup, table, tbody, td, template, textarea, tfoot, th, thead, time, title, tr, track, u, ul, var, video, wbr
    )

{-| This module provides a set of types and functions for generating context-dependent HTML elements.


# Table of Contents


## Types

  - [Html](#Html)


## Contextualization

  - [contextualize](#contextualize)
  - [decontextualize](#decontextualize)
  - [using](#using)


## Text

  - [text](#text)


## Elements

  - [a](#a)
  - [abbr](#abbr)
  - [address](#address)
  - [area](#area)
  - [article](#article)
  - [aside](#aside)
  - [audio](#audio)
  - [b](#b)
  - [base](#base)
  - [bdi](#bdi)
  - [bdo](#bdo)
  - [blockquote](#blockquote)
  - [body](#body)
  - [br](#br)
  - [button](#button)
  - [canvas](#canvas)
  - [caption](#caption)
  - [cite](#cite)
  - [code](#code)
  - [col](#col)
  - [colgroup](#colgroup)
  - [data](#data)
  - [datalist](#datalist)
  - [dd](#dd)
  - [del](#del)
  - [details](#details)
  - [dfn](#dfn)
  - [dialog](#dialog)
  - [div](#div)
  - [dl](#dl)
  - [dt](#dt)
  - [em](#em)
  - [embed](#embed)
  - [fieldset](#fieldset)
  - [figcaption](#figcaption)
  - [figure](#figure)
  - [footer](#footer)
  - [form](#form)
  - [h1](#h1)
  - [h2](#h2)
  - [h3](#h3)
  - [h4](#h4)
  - [h5](#h5)
  - [h6](#h6)
  - [head](#head)
  - [header](#header)
  - [hgroup](#hgroup)
  - [hr](#hr)
  - [html](#html)
  - [i](#i)
  - [iframe](#iframe)
  - [img](#img)
  - [input](#input)
  - [ins](#ins)
  - [kbd](#kbd)
  - [label](#label)
  - [legend](#legend)
  - [li](#li)
  - [link](#link)
  - [main\_](#main_)
  - [map](#map)
  - [mark](#mark)
  - [menu](#menu)
  - [meta](#meta)
  - [meter](#meter)
  - [nav](#nav)
  - [noscript](#noscript)
  - [object](#object)
  - [ol](#ol)
  - [optgroup](#optgroup)
  - [option](#option)
  - [output](#output)
  - [p](#p)
  - [picture](#picture)
  - [pre](#pre)
  - [progress](#progress)
  - [q](#q)
  - [rp](#rp)
  - [rt](#rt)
  - [ruby](#ruby)
  - [s](#s)
  - [samp](#samp)
  - [section](#section)
  - [search](#search)
  - [select](#select)
  - [slot](#slot)
  - [small](#small)
  - [source](#source)
  - [span](#span)
  - [strong](#strong)
  - [style](#style)
  - [sub](#sub)
  - [summary](#summary)
  - [sup](#sup)
  - [table](#table)
  - [tbody](#tbody)
  - [td](#td)
  - [template](#template)
  - [textarea](#textarea)
  - [tfoot](#tfoot)
  - [th](#th)
  - [thead](#thead)
  - [time](#time)
  - [title](#title)
  - [tr](#tr)
  - [track](#track)
  - [u](#u)
  - [ul](#ul)
  - [var](#var)
  - [video](#video)
  - [wbr](#wbr)

> **_NOTE:_** The HTML `script` element is omitted in this package due to incompatibility with Elm.


# Documentation


## Types

@docs Html


## Contextualization

@docs contextualize, decontextualize, using


## Text

@docs text


## Elements

@docs a, abbr, address, area, article, aside, audio, b, base, bdi, bdo, blockquote, body, br, button, canvas, caption, cite, code, col, colgroup, data, datalist, dd, del, details, dfn, dialog, div, dl, dt, em, embed, fieldset, figcaption, figure, footer, form, h1, h2, h3, h4, h5, h6, head, header, hgroup, hr, html, i, iframe, img, input, ins, kbd, label, legend, li, link, main_, map, mark, menu, meta, meter, nav, noscript, object, ol, optgroup, option, output, p, picture, pre, progress, q, rp, rt, ruby, s, samp, section, search, select, slot, small, source, span, strong, style, sub, summary, sup, table, tbody, td, template, textarea, tfoot, th, thead, time, title, tr, track, u, ul, var, video, wbr

-}

import Html.Attributes exposing (Attribute)
import VirtualDom



-- TYPES


{-| Represents an HTML element encompassing a context (`ctx`) and message (`msg`), also known as a contextualized HTML element.
-}
type Html ctx msg
    = Html (ctx -> VirtualDom.Node msg)



-- CONTEXTUALIZATION


{-| Converts a decontextualized virtual DOM node into a contextualized HTML element.
-}
contextualize : VirtualDom.Node msg -> Html ctx msg
contextualize decontextualizedHtml =
    Html (\_ -> decontextualizedHtml)


{-| Converts a contextualized HTML element into a decontextualized virtual DOM node.
-}
decontextualize : ctx -> Html ctx msg -> VirtualDom.Node msg
decontextualize context (Html apply) =
    apply context


{-| Establishes a dependency between a context and a contextualized HTML element.
-}
using : (ctx -> Html ctx msg) -> Html ctx msg
using apply =
    Html (\context -> decontextualize context <| apply context)



-- TEXT


{-| Constructs a contextualized HTML text node.
-}
text : String -> Html ctx msg
text content =
    Html (\_ -> VirtualDom.text content)



-- ELEMENTS


{-| Constructs a contextualized HTML `a` element.

Supported attributes: _globals_, `download`, `href`, `hreflang`, `ping`, `referrerpolicy`, `rel`, `target`, `type`

-}
a : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
a attributes children =
    element "a" attributes children


{-| Constructs a contextualized HTML `abbr` element.

Supported attributes: _globals_

-}
abbr : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
abbr attributes children =
    element "abbr" attributes children


{-| Constructs a contextualized HTML `address` element.

Supported attributes: _globals_

-}
address : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
address attributes children =
    element "address" attributes children


{-| Constructs a contextualized HTML `area` element.

Supported attributes: _globals_, `alt`, `coords`, `download`, `href`, `ping`, `referrerpolicy`, `rel`, `shape`, `target`

-}
area : List (Attribute ctx msg) -> Html ctx msg
area attributes =
    element "area" attributes []


{-| Constructs a contextualized HTML `article` element.

Supported attributes: _globals_

-}
article : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
article attributes children =
    element "article" attributes children


{-| Constructs a contextualized HTML `aside` element.

Supported attributes: _globals_

-}
aside : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
aside attributes children =
    element "aside" attributes children


{-| Constructs a contextualized HTML `audio` element.

Supported attributes: _globals_, `autoplay`, `controls`, `crossorigin`, `loop`, `muted`, `preload`, `src`

-}
audio : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
audio attributes children =
    element "audio" attributes children


{-| Constructs a contextualized HTML `b` element.

Supported attributes: _globals_

-}
b : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
b attributes children =
    element "b" attributes children


{-| Constructs a contextualized HTML `base` element.

Supported attributes: _globals_, `href`, `target`

-}
base : List (Attribute ctx msg) -> Html ctx msg
base attributes =
    element "base" attributes []


{-| Constructs a contextualized HTML `bdi` element.

Supported attributes: _globals_

-}
bdi : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
bdi attributes children =
    element "bdi" attributes children


{-| Constructs a contextualized HTML `bdo` element.

Supported attributes: _globals_

-}
bdo : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
bdo attributes children =
    element "bdo" attributes children


{-| Constructs a contextualized HTML `blockquote` element.

Supported attributes: _globals_, `cite`

-}
blockquote : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
blockquote attributes children =
    element "blockquote" attributes children


{-| Constructs a contextualized HTML `body` element.

Supported attributes: _globals_

-}
body : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
body attributes children =
    element "body" attributes children


{-| Constructs a contextualized HTML `br` element.

Supported attributes: _globals_

-}
br : List (Attribute ctx msg) -> Html ctx msg
br attributes =
    element "br" attributes []


{-| Constructs a contextualized HTML `button` element.

Supported attributes: _globals_, `disabled`, `form`, `formaction`, `formenctype`, `formmethod`, `formnovalidate`, `formtarget`, `name`, `popovertarget`, `popovertargetaction`, `type`, `value`

-}
button : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
button attributes children =
    element "button" attributes children


{-| Constructs a contextualized HTML `canvas` element.

Supported attributes: _globals_, `height`, `width`

-}
canvas : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
canvas attributes children =
    element "canvas" attributes children


{-| Constructs a contextualized HTML `caption` element.

Supported attributes: _globals_

-}
caption : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
caption attributes children =
    element "caption" attributes children


{-| Constructs a contextualized HTML `cite` element.

Supported attributes: _globals_

-}
cite : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
cite attributes children =
    element "cite" attributes children


{-| Constructs a contextualized HTML `code` element.

Supported attributes: _globals_

-}
code : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
code attributes children =
    element "code" attributes children


{-| Constructs a contextualized HTML `col` element.

Supported attributes: _globals_, `span`

-}
col : List (Attribute ctx msg) -> Html ctx msg
col attributes =
    element "col" attributes []


{-| Constructs a contextualized HTML `colgroup` element.

Supported attributes: _globals_, `span`

-}
colgroup : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
colgroup attributes children =
    element "colgroup" attributes children


{-| Constructs a contextualized HTML `data` element.

Supported attributes: _globals_, `value`

-}
data : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
data attributes children =
    element "data" attributes children


{-| Constructs a contextualized HTML `datalist` element.

Supported attributes: _globals_

-}
datalist : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
datalist attributes children =
    element "datalist" attributes children


{-| Constructs a contextualized HTML `dd` element.

Supported attributes: _globals_

-}
dd : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
dd attributes children =
    element "dd" attributes children


{-| Constructs a contextualized HTML `del` element.

Supported attributes: _globals_, `cite`, `datetime`

-}
del : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
del attributes children =
    element "del" attributes children


{-| Constructs a contextualized HTML `details` element.

Supported attributes: _globals_, `name`, `open`

-}
details : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
details attributes children =
    element "details" attributes children


{-| Constructs a contextualized HTML `dfn` element.

Supported attributes: _globals_

-}
dfn : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
dfn attributes children =
    element "dfn" attributes children


{-| Constructs a contextualized HTML `dialog` element.

Supported attributes: _globals_, `open`

-}
dialog : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
dialog attributes children =
    element "dialog" attributes children


{-| Constructs a contextualized HTML `div` element.

Supported attributes: _globals_

-}
div : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
div attributes children =
    element "div" attributes children


{-| Constructs a contextualized HTML `dl` element.

Supported attributes: _globals_

-}
dl : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
dl attributes children =
    element "dl" attributes children


{-| Constructs a contextualized HTML `dt` element.

Supported attributes: _globals_

-}
dt : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
dt attributes children =
    element "dt" attributes children


{-| Constructs a contextualized HTML `em` element.

Supported attributes: _globals_

-}
em : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
em attributes children =
    element "em" attributes children


{-| Constructs a contextualized HTML `embed` element.

Supported attributes: _globals_, `height`, `src`, `type`, `width`

-}
embed : List (Attribute ctx msg) -> Html ctx msg
embed attributes =
    element "embed" attributes []


{-| Constructs a contextualized HTML `fieldset` element.

Supported attributes: _globals_, `disabled`, `form`, `name`

-}
fieldset : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
fieldset attributes children =
    element "fieldset" attributes children


{-| Constructs a contextualized HTML `figcaption` element.

Supported attributes: _globals_

-}
figcaption : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
figcaption attributes children =
    element "figcaption" attributes children


{-| Constructs a contextualized HTML `figure` element.

Supported attributes: _globals_

-}
figure : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
figure attributes children =
    element "figure" attributes children


{-| Constructs a contextualized HTML `footer` element.

Supported attributes: _globals_

-}
footer : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
footer attributes children =
    element "footer" attributes children


{-| Constructs a contextualized HTML `form` element.

Supported attributes: _globals_, `accept-charset`, `action`, `autocomplete`, `enctype`, `method`, `name`, `novalidate`, `rel`, `target`

-}
form : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
form attributes children =
    element "form" attributes children


{-| Constructs a contextualized HTML `h1` element.

Supported attributes: _globals_

-}
h1 : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
h1 attributes children =
    element "h1" attributes children


{-| Constructs a contextualized HTML `h2` element.

Supported attributes: _globals_

-}
h2 : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
h2 attributes children =
    element "h2" attributes children


{-| Constructs a contextualized HTML `h3` element.

Supported attributes: _globals_

-}
h3 : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
h3 attributes children =
    element "h3" attributes children


{-| Constructs a contextualized HTML `h4` element.

Supported attributes: _globals_

-}
h4 : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
h4 attributes children =
    element "h4" attributes children


{-| Constructs a contextualized HTML `h5` element.

Supported attributes: _globals_

-}
h5 : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
h5 attributes children =
    element "h5" attributes children


{-| Constructs a contextualized HTML `h6` element.

Supported attributes: _globals_

-}
h6 : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
h6 attributes children =
    element "h6" attributes children


{-| Constructs a contextualized HTML `head` element.

Supported attributes: _globals_

-}
head : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
head attributes children =
    element "head" attributes children


{-| Constructs a contextualized HTML `header` element.

Supported attributes: _globals_

-}
header : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
header attributes children =
    element "header" attributes children


{-| Constructs a contextualized HTML `hgroup` element.

Supported attributes: _globals_

-}
hgroup : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
hgroup attributes children =
    element "hgroup" attributes children


{-| Constructs a contextualized HTML `hr` element.

Supported attributes: _globals_

-}
hr : List (Attribute ctx msg) -> Html ctx msg
hr attributes =
    element "hr" attributes []


{-| Constructs a contextualized HTML `html` element.

Supported attributes: _globals_

-}
html : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
html attributes children =
    element "html" attributes children


{-| Constructs a contextualized HTML `i` element.

Supported attributes: _globals_

-}
i : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
i attributes children =
    element "i" attributes children


{-| Constructs a contextualized HTML `iframe` element.

Supported attributes: _globals_, `allow`, `allowfullscreen`, `height`, `loading`, `name`, `referrerpolicy`, `sandbox`, `src`, `srcdoc`, `width`

-}
iframe : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
iframe attributes children =
    element "iframe" attributes children


{-| Constructs a contextualized HTML `img` element.

Supported attributes: _globals_, `alt`, `crossorigin`, `decoding`, `fetchpriority`, `height`, `ismap`, `loading`, `referrerpolicy`, `sizes`, `src`, `srcset`, `usemap`, `width`

-}
img : List (Attribute ctx msg) -> Html ctx msg
img attributes =
    element "img" attributes []


{-| Constructs a contextualized HTML `input` element.

Supported attributes: _globals_, `accept`, `alt`, `autocomplete`, `checked`, `dirname`, `disabled`, `form`, `formaction`, `formenctype`, `formmethod`, `formnovalidate`, `formtarget`, `height`, `list`, `max`, `maxlength`, `min`, `minlength`, `multiple`, `name`, `pattern`, `placeholder`, `popovertarget`, `popovertargetaction`, `readonly`, `required`, `size`, `src`, `step`, `type`, `value`, `width`

-}
input : List (Attribute ctx msg) -> Html ctx msg
input attributes =
    element "input" attributes []


{-| Constructs a contextualized HTML `ins` element.

Supported attributes: _globals_, `cite`, `datetime`

-}
ins : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
ins attributes children =
    element "ins" attributes children


{-| Constructs a contextualized HTML `kbd` element.

Supported attributes: _globals_

-}
kbd : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
kbd attributes children =
    element "kbd" attributes children


{-| Constructs a contextualized HTML `label` element.

Supported attributes: _globals_, `for`

-}
label : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
label attributes children =
    element "label" attributes children


{-| Constructs a contextualized HTML `legend` element.

Supported attributes: _globals_

-}
legend : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
legend attributes children =
    element "legend" attributes children


{-| Constructs a contextualized HTML `li` element.

Supported attributes: _globals_, `value`

-}
li : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
li attributes children =
    element "li" attributes children


{-| Constructs a contextualized HTML `link` element.

Supported attributes: _globals_, `as`, `blocking`, `color`, `crossorigin`, `disabled`, `fetchpriority`, `href`, `hreflang`, `imagesizes`, `imagesrcset`, `integrity`, `media`, `referrerpolicy`, `rel`, `sizes`, `type`

-}
link : List (Attribute ctx msg) -> Html ctx msg
link attributes =
    element "link" attributes []


{-| Constructs a contextualized HTML `main` element.

Supported attributes: _globals_

-}
main_ : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
main_ attributes children =
    element "main" attributes children


{-| Constructs a contextualized HTML `map` element.

Supported attributes: _globals_, `name`

-}
map : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
map attributes children =
    element "map" attributes children


{-| Constructs a contextualized HTML `mark` element.

Supported attributes: _globals_

-}
mark : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
mark attributes children =
    element "mark" attributes children


{-| Constructs a contextualized HTML `menu` element.

Supported attributes: _globals_

-}
menu : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
menu attributes children =
    element "menu" attributes children


{-| Constructs a contextualized HTML `meta` element.

Supported attributes: _globals_, `charset`, `content`, `http-equiv`, `media`, `name`

-}
meta : List (Attribute ctx msg) -> Html ctx msg
meta attributes =
    element "meta" attributes []


{-| Constructs a contextualized HTML `meter` element.

Supported attributes: _globals_, `high`, `low`, `max`, `min`, `optimum`, `value`

-}
meter : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
meter attributes children =
    element "meter" attributes children


{-| Constructs a contextualized HTML `nav` element.

Supported attributes: _globals_

-}
nav : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
nav attributes children =
    element "nav" attributes children


{-| Constructs a contextualized HTML `noscript` element.

Supported attributes: _globals_

-}
noscript : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
noscript attributes children =
    element "noscript" attributes children


{-| Constructs a contextualized HTML `object` element.

Supported attributes: _globals_, `data`, `form`, `height`, `name`, `type`, `width`

-}
object : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
object attributes children =
    element "object" attributes children


{-| Constructs a contextualized HTML `ol` element.

Supported attributes: _globals_, `reversed`, `start`, `type`

-}
ol : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
ol attributes children =
    element "ol" attributes children


{-| Constructs a contextualized HTML `optgroup` element.

Supported attributes: _globals_, `disabled`, `label`

-}
optgroup : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
optgroup attributes children =
    element "optgroup" attributes children


{-| Constructs a contextualized HTML `option` element.

Supported attributes: _globals_, `disabled`, `label`, `selected`, `value`

-}
option : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
option attributes children =
    element "option" attributes children


{-| Constructs a contextualized HTML `output` element.

Supported attributes: _globals_, `for`, `form`, `name`

-}
output : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
output attributes children =
    element "output" attributes children


{-| Constructs a contextualized HTML `p` element.

Supported attributes: _globals_

-}
p : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
p attributes children =
    element "p" attributes children


{-| Constructs a contextualized HTML `picture` element.

Supported attributes: _globals_

-}
picture : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
picture attributes children =
    element "picture" attributes children


{-| Constructs a contextualized HTML `pre` element.

Supported attributes: _globals_

-}
pre : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
pre attributes children =
    element "pre" attributes children


{-| Constructs a contextualized HTML `progress` element.

Supported attributes: _globals_, `max`, `value`

-}
progress : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
progress attributes children =
    element "progress" attributes children


{-| Constructs a contextualized HTML `q` element.

Supported attributes: _globals_, `cite`

-}
q : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
q attributes children =
    element "q" attributes children


{-| Constructs a contextualized HTML `rp` element.

Supported attributes: _globals_

-}
rp : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
rp attributes children =
    element "rp" attributes children


{-| Constructs a contextualized HTML `rt` element.

Supported attributes: _globals_

-}
rt : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
rt attributes children =
    element "rt" attributes children


{-| Constructs a contextualized HTML `ruby` element.

Supported attributes: _globals_

-}
ruby : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
ruby attributes children =
    element "ruby" attributes children


{-| Constructs a contextualized HTML `s` element.

Supported attributes: _globals_

-}
s : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
s attributes children =
    element "s" attributes children


{-| Constructs a contextualized HTML `samp` element.

Supported attributes: _globals_

-}
samp : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
samp attributes children =
    element "samp" attributes children


{-| Constructs a contextualized HTML `search` element.

Supported attributes: _globals_

-}
search : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
search attributes children =
    element "search" attributes children


{-| Constructs a contextualized HTML `section` element.

Supported attributes: _globals_

-}
section : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
section attributes children =
    element "section" attributes children


{-| Constructs a contextualized HTML `select` element.

Supported attributes: _globals_, `autocomplete`, `disabled`, `form`, `multiple`, `name`, `required`, `size`

-}
select : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
select attributes children =
    element "select" attributes children


{-| Constructs a contextualized HTML `slot` element.

Supported attributes: _globals_, `name`

-}
slot : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
slot attributes children =
    element "slot" attributes children


{-| Constructs a contextualized HTML `small` element.

Supported attributes: _globals_

-}
small : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
small attributes children =
    element "small" attributes children


{-| Constructs a contextualized HTML `source` element.

Supported attributes: _globals_, `height`, `media`, `sizes`, `src`, `srcset`, `type`, `width`

-}
source : List (Attribute ctx msg) -> Html ctx msg
source attributes =
    element "source" attributes []


{-| Constructs a contextualized HTML `span` element.

Supported attributes: _globals_

-}
span : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
span attributes children =
    element "span" attributes children


{-| Constructs a contextualized HTML `strong` element.

Supported attributes: _globals_

-}
strong : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
strong attributes children =
    element "strong" attributes children


{-| Constructs a contextualized HTML `style` element.

Supported attributes: _globals_, `blocking`, `media`

-}
style : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
style attributes children =
    element "style" attributes children


{-| Constructs a contextualized HTML `sub` element.

Supported attributes: _globals_

-}
sub : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
sub attributes children =
    element "sub" attributes children


{-| Constructs a contextualized HTML `summary` element.

Supported attributes: _globals_

-}
summary : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
summary attributes children =
    element "summary" attributes children


{-| Constructs a contextualized HTML `sup` element.

Supported attributes: _globals_

-}
sup : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
sup attributes children =
    element "sup" attributes children


{-| Constructs a contextualized HTML `table` element.

Supported attributes: _globals_

-}
table : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
table attributes children =
    element "table" attributes children


{-| Constructs a contextualized HTML `tbody` element.

Supported attributes: _globals_

-}
tbody : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
tbody attributes children =
    element "tbody" attributes children


{-| Constructs a contextualized HTML `td` element.

Supported attributes: _globals_, `colspan`, `headers`, `rowspan`

-}
td : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
td attributes children =
    element "td" attributes children


{-| Constructs a contextualized HTML `template` element.

Supported attributes: _globals_, `shadowrootclonable`, `shadowrootdelegatesfocus`, `shadowrootmode`, `shadowrootserializable`

-}
template : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
template attributes children =
    element "template" attributes children


{-| Constructs a contextualized HTML `textarea` element.

Supported attributes: _globals_, `audocomplete`, `cols`, `dirname`, `disabled`, `form`, `maxlength`, `minlength`, `name`, `placeholder`, `readonly`, `required`, `rows`, `wrap`

-}
textarea : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
textarea attributes children =
    element "textarea" attributes children


{-| Constructs a contextualized HTML `tfoot` element.

Supported attributes: _globals_

-}
tfoot : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
tfoot attributes children =
    element "tfoot" attributes children


{-| Constructs a contextualized HTML `th` element.

Supported attributes: _globals_, `abbr`, `colspan`, `headers`, `rowspan`, `scope`

-}
th : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
th attributes children =
    element "th" attributes children


{-| Constructs a contextualized HTML `thead` element.

Supported attributes: _globals_

-}
thead : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
thead attributes children =
    element "thead" attributes children


{-| Constructs a contextualized HTML `time` element.

Supported attributes: _globals_, `datetime`

-}
time : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
time attributes children =
    element "time" attributes children


{-| Constructs a contextualized HTML `title` element.

Supported attributes: _globals_

-}
title : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
title attributes children =
    element "title" attributes children


{-| Constructs a contextualized HTML `tr` element.

Supported attributes: _globals_

-}
tr : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
tr attributes children =
    element "tr" attributes children


{-| Constructs a contextualized HTML `track` element.

Supported attributes: _globals_, `default`, `kind`, `label`, `src`, `srclang`

-}
track : List (Attribute ctx msg) -> Html ctx msg
track attributes =
    element "track" attributes []


{-| Constructs a contextualized HTML `u` element.

Supported attributes: _globals_

-}
u : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
u attributes children =
    element "u" attributes children


{-| Constructs a contextualized HTML `ul` element.

Supported attributes: _globals_

-}
ul : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
ul attributes children =
    element "ul" attributes children


{-| Constructs a contextualized HTML `var` element.

Supported attributes: _globals_

-}
var : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
var attributes children =
    element "var" attributes children


{-| Constructs a contextualized HTML `video` element.

Supported attributes: _globals_, `autoplay`, `controls`, `crossorigin`, `height`, `loop`, `muted`, `playsinline`, `poster`, `preload`, `src`, `width`

-}
video : List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
video attributes children =
    element "video" attributes children


{-| Constructs a contextualized HTML `wbr` element.

Supported attributes: _globals_

-}
wbr : List (Attribute ctx msg) -> Html ctx msg
wbr attributes =
    element "wbr" attributes []



-- PRIVATE


{-| Constructs a contextualized HTML element.
-}
element : String -> List (Attribute ctx msg) -> List (Html ctx msg) -> Html ctx msg
element name attributes children =
    Html
        (\context ->
            VirtualDom.node
                name
                (List.map (Html.Attributes.decontextualize context) attributes)
                (List.map (decontextualize context) children)
        )
