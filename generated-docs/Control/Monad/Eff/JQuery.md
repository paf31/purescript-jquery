## Module Control.Monad.Eff.JQuery

This module defines foreign types and functions for working with
the jQuery library.

#### `JQuery`

``` purescript
data JQuery :: Type
```

The type of collections of jQuery-wrapped nodes.

#### `JQueryEvent`

``` purescript
data JQueryEvent :: Type
```

Type of jQuery event objects.

#### `Selector`

``` purescript
type Selector = String
```

A type synonym to help readability of type signatures.

#### `ready`

``` purescript
ready :: forall eff a. Eff (dom :: DOM | eff) a -> Eff (dom :: DOM | eff) Unit
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
setAttr :: forall eff a. String -> a -> JQuery -> Eff (dom :: DOM | eff) Unit
```

Set a single attribute.

#### `attr`

``` purescript
attr :: forall eff attr. {  | attr } -> JQuery -> Eff (dom :: DOM | eff) Unit
```

Set multiple attributes.

#### `css`

``` purescript
css :: forall eff css. {  | css } -> JQuery -> Eff (dom :: DOM | eff) Unit
```

Set CSS properties.

#### `hasClass`

``` purescript
hasClass :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) Boolean
```

Test if an element has a CSS class.

#### `toggleClass`

``` purescript
toggleClass :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) Unit
```

Toggle the specified CSS class.

#### `setClass`

``` purescript
setClass :: forall eff. String -> Boolean -> JQuery -> Eff (dom :: DOM | eff) Unit
```

Set the specified CSS class.

#### `addClass`

``` purescript
addClass :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) Unit
```

Add the specified CSS class.

#### `removeClass`

``` purescript
removeClass :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) Unit
```

Remove the specified CSS class.

#### `setProp`

``` purescript
setProp :: forall a eff. String -> a -> JQuery -> Eff (dom :: DOM | eff) Unit
```

Set a single property.

#### `getProp`

``` purescript
getProp :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) Foreign
```

Get a property value.

#### `append`

``` purescript
append :: forall eff. JQuery -> JQuery -> Eff (dom :: DOM | eff) Unit
```

Append the first node as a child node of the second.

#### `remove`

``` purescript
remove :: forall eff. JQuery -> Eff (dom :: DOM | eff) Unit
```

Remove selected elements.

#### `clear`

``` purescript
clear :: forall eff. JQuery -> Eff (dom :: DOM | eff) Unit
```

Remove child elements.

#### `before`

``` purescript
before :: forall eff. JQuery -> JQuery -> Eff (dom :: DOM | eff) Unit
```

Insert an element before another.

#### `appendText`

``` purescript
appendText :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) Unit
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
setText :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) Unit
```

Set the text content of an element.

#### `getHtml`

``` purescript
getHtml :: forall eff. JQuery -> Eff (dom :: DOM | eff) String
```

Get the html content of an element.

#### `setHtml`

``` purescript
setHtml :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) Unit
```

Set the html content of an element

#### `getValue`

``` purescript
getValue :: forall eff. JQuery -> Eff (dom :: DOM | eff) Foreign
```

Get the value of a form element.

#### `setValue`

``` purescript
setValue :: forall eff a. a -> JQuery -> Eff (dom :: DOM | eff) Unit
```

Set the value of a form element.

#### `toggle`

``` purescript
toggle :: forall eff. JQuery -> Eff (dom :: DOM | eff) Unit
```

Toggle visibility of an element.

#### `setVisible`

``` purescript
setVisible :: forall eff. Boolean -> JQuery -> Eff (dom :: DOM | eff) Unit
```

Set the visibility of an element.

#### `hide`

``` purescript
hide :: forall eff. JQuery -> Eff (dom :: DOM | eff) Unit
```

Hide elements.

#### `display`

``` purescript
display :: forall eff. JQuery -> Eff (dom :: DOM | eff) Unit
```

Show elements.

#### `on`

``` purescript
on :: forall eff a. String -> (JQueryEvent -> JQuery -> Eff (dom :: DOM | eff) a) -> JQuery -> Eff (dom :: DOM | eff) Unit
```

Register an event handler.

#### `on'`

``` purescript
on' :: forall eff a. String -> Selector -> (JQueryEvent -> JQuery -> Eff (dom :: DOM | eff) a) -> JQuery -> Eff (dom :: DOM | eff) Unit
```

Register an event handler for elements matching a selector.

#### `toArray`

``` purescript
toArray :: forall eff. JQuery -> Eff (dom :: DOM | eff) (Array JQuery)
```

Get an array of matching elements.

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

#### `getTarget`

``` purescript
getTarget :: forall eff. JQueryEvent -> Eff (dom :: DOM | eff) JQuery
```

Get the `target` propery of the event object.

#### `getCurrentTarget`

``` purescript
getCurrentTarget :: forall eff. JQueryEvent -> Eff (dom :: DOM | eff) JQuery
```

Get the `currentTarget` property from the event object.

#### `getPageX`

``` purescript
getPageX :: forall eff. JQueryEvent -> Eff (dom :: DOM | eff) Number
```

Get the `pageX` property from the event object.

#### `getPageY`

``` purescript
getPageY :: forall eff. JQueryEvent -> Eff (dom :: DOM | eff) Number
```

Get the `pageY` property from the event object.

#### `getWhich`

``` purescript
getWhich :: forall eff. JQueryEvent -> Eff (dom :: DOM | eff) Int
```

Get the `which` property from the event object.

#### `getMetaKey`

``` purescript
getMetaKey :: forall eff. JQueryEvent -> Eff (dom :: DOM | eff) Boolean
```

Get the `metaKey` property from the event object.

#### `clone`

``` purescript
clone :: forall eff. JQuery -> Eff (dom :: DOM | eff) JQuery
```

Create a deep copy of the set of matched elements.

#### `cloneWithDataAndEvents`

``` purescript
cloneWithDataAndEvents :: forall eff. JQuery -> Eff (dom :: DOM | eff) JQuery
```

Create a deep copy of the set of matched elements,
including event handlers and element data.


