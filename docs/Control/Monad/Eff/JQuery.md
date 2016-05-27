## Module Control.Monad.Eff.JQuery

This module defines foreign types and functions for working with 
the jQuery library.

#### `JQuery`

``` purescript
data JQuery :: *
```

The type of collections of jQuery-wrapped nodes.

#### `JQueryEvent`

``` purescript
data JQueryEvent :: *
```

Type of jQuery event objects.

#### `Selector`

``` purescript
type Selector = String
```

A type synonym to help readability of type signatures.

#### `ready`

``` purescript
ready :: forall eff a. Eff (dom :: DOM | eff) a -> Eff (dom :: DOM | eff) JQuery
```

Run a function when the document is loaded.

#### `select`

``` purescript
select :: forall eff. Selector -> Eff (dom :: DOM | eff) JQuery
```

Wrapper function for jQuery selection $('..')

#### `find`

``` purescript
find :: forall eff. Selector -> JQuery -> Eff (dom :: DOM | eff) JQuery
```

Find child nodes matching a selector

#### `parent`

``` purescript
parent :: forall eff. JQuery -> Eff (dom :: DOM | eff) JQuery
```

Get the parent elements.

#### `closest`

``` purescript
closest :: forall eff. Selector -> JQuery -> Eff (dom :: DOM | eff) JQuery
```

Find the closest element matching the selector.

#### `create`

``` purescript
create :: forall eff. String -> Eff (dom :: DOM | eff) JQuery
```

Create an element.

#### `setAttr`

``` purescript
setAttr :: forall eff a. String -> a -> JQuery -> Eff (dom :: DOM | eff) JQuery
```

Set a single attribute.

#### `attr`

``` purescript
attr :: forall eff attr. {  | attr } -> JQuery -> Eff (dom :: DOM | eff) JQuery
```

Set multiple attributes.

#### `css`

``` purescript
css :: forall eff css. {  | css } -> JQuery -> Eff (dom :: DOM | eff) JQuery
```

Set CSS properties.

#### `hasClass`

``` purescript
hasClass :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) Boolean
```

Test if an element has a CSS class.

#### `toggleClass`

``` purescript
toggleClass :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) JQuery
```

Toggle the specified CSS class.

#### `setClass`

``` purescript
setClass :: forall eff. String -> Boolean -> JQuery -> Eff (dom :: DOM | eff) JQuery
```

Set the specified CSS class.

#### `addClass`

``` purescript
addClass :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) JQuery
```

Add the specified CSS class.

#### `removeClass`

``` purescript
removeClass :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) JQuery
```

Remove the specified CSS class.

#### `setProp`

``` purescript
setProp :: forall a eff. String -> a -> JQuery -> Eff (dom :: DOM | eff) JQuery
```

Set a single property.

#### `getProp`

``` purescript
getProp :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) Foreign
```

Get a property value.

#### `append`

``` purescript
append :: forall eff. JQuery -> JQuery -> Eff (dom :: DOM | eff) JQuery
```

Append the first node as a child node of the second.

#### `remove`

``` purescript
remove :: forall eff. JQuery -> Eff (dom :: DOM | eff) JQuery
```

Remove selected elements.

#### `clear`

``` purescript
clear :: forall eff. JQuery -> Eff (dom :: DOM | eff) JQuery
```

Remove child elements.

#### `before`

``` purescript
before :: forall eff. JQuery -> JQuery -> Eff (dom :: DOM | eff) JQuery
```

Insert an element before another.

#### `appendText`

``` purescript
appendText :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) JQuery
```

Append text as a child node.

#### `body`

``` purescript
body :: forall eff. Eff (dom :: DOM | eff) JQuery
```

Get the document body node.

#### `getText`

``` purescript
getText :: forall eff. JQuery -> Eff (dom :: DOM | eff) String
```

Get the text content of an element.

#### `setText`

``` purescript
setText :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) JQuery
```

Set the text content of an element.

#### `getHtml`

``` purescript
getHtml :: forall eff. JQuery -> Eff (dom :: DOM | eff) String
```

Get the html content of an element.

#### `setHtml`

``` purescript
setHtml :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) JQuery
```

Set the html content of an element

#### `getValue`

``` purescript
getValue :: forall eff. JQuery -> Eff (dom :: DOM | eff) Foreign
```

Get the value of a form element.

#### `setValue`

``` purescript
setValue :: forall eff a. a -> JQuery -> Eff (dom :: DOM | eff) JQuery
```

Set the value of a form element.

#### `toggle`

``` purescript
toggle :: forall eff. JQuery -> Eff (dom :: DOM | eff) JQuery
```

Toggle visibility of an element.

#### `setVisible`

``` purescript
setVisible :: forall eff. Boolean -> JQuery -> Eff (dom :: DOM | eff) JQuery
```

Set the visibility of an element.

#### `hide`

``` purescript
hide :: forall eff. JQuery -> Eff (dom :: DOM | eff) JQuery
```

Hide elements.

#### `display`

``` purescript
display :: forall eff. JQuery -> Eff (dom :: DOM | eff) JQuery
```

Show elements.

#### `on`

``` purescript
on :: forall eff a. String -> (JQueryEvent -> JQuery -> Eff (dom :: DOM | eff) a) -> JQuery -> Eff (dom :: DOM | eff) JQuery
```

Register an event handler.

#### `on'`

``` purescript
on' :: forall eff a. String -> Selector -> (JQueryEvent -> JQuery -> Eff (dom :: DOM | eff) a) -> JQuery -> Eff (dom :: DOM | eff) JQuery
```

Register an event handler for elements matching a selector.

#### `toArray`

``` purescript
toArray :: forall eff. JQuery -> Eff (dom :: DOM | eff) (Array JQuery)
```

Convert the elements in the JQuery into an array of JQuery.

#### `preventDefault`

``` purescript
preventDefault :: forall eff. JQueryEvent -> Eff (dom :: DOM | eff) Unit
```

Prevent the default action for an event.

#### `stopPropagation`

``` purescript
stopPropagation :: forall eff. JQueryEvent -> Eff (dom :: DOM | eff) Unit
```

Stop propagation an event.

#### `stopImmediatePropagation`

``` purescript
stopImmediatePropagation :: forall eff. JQueryEvent -> Eff (dom :: DOM | eff) Unit
```

Stop immediate propagation an event.


