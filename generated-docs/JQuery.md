## Module JQuery

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
ready :: forall a. Effect a -> Effect Unit
```

Run a function when the document is loaded.

#### `select`

``` purescript
select :: Selector -> Effect JQuery
```

Wrapper function for jQuery selection $('..')

#### `find`

``` purescript
find :: Selector -> JQuery -> Effect JQuery
```

Find child nodes matching a selector

#### `parent`

``` purescript
parent :: JQuery -> Effect JQuery
```

Get the parent elements.

#### `closest`

``` purescript
closest :: Selector -> JQuery -> Effect JQuery
```

Find the closest element matching the selector.

#### `create`

``` purescript
create :: String -> Effect JQuery
```

Create an element.

#### `setAttr`

``` purescript
setAttr :: forall a. String -> a -> JQuery -> Effect Unit
```

Set a single attribute.

#### `getAttr`

``` purescript
getAttr :: String -> JQuery -> Effect (Maybe String)
```

Get an attribute value.

#### `attr`

``` purescript
attr :: forall attr. {  | attr } -> JQuery -> Effect Unit
```

Set multiple attributes.

#### `css`

``` purescript
css :: forall css. {  | css } -> JQuery -> Effect Unit
```

Set CSS properties.

#### `hasClass`

``` purescript
hasClass :: String -> JQuery -> Effect Boolean
```

Test if an element has a CSS class.

#### `toggleClass`

``` purescript
toggleClass :: String -> JQuery -> Effect Unit
```

Toggle the specified CSS class.

#### `setClass`

``` purescript
setClass :: String -> Boolean -> JQuery -> Effect Unit
```

Set the specified CSS class.

#### `addClass`

``` purescript
addClass :: String -> JQuery -> Effect Unit
```

Add the specified CSS class.

#### `removeClass`

``` purescript
removeClass :: String -> JQuery -> Effect Unit
```

Remove the specified CSS class.

#### `setProp`

``` purescript
setProp :: forall a. String -> a -> JQuery -> Effect Unit
```

Set a single property.

#### `getProp`

``` purescript
getProp :: String -> JQuery -> Effect Foreign
```

Get a property value.

#### `append`

``` purescript
append :: JQuery -> JQuery -> Effect Unit
```

Append the first node as a child node of the second.

#### `remove`

``` purescript
remove :: JQuery -> Effect Unit
```

Remove selected elements.

#### `clear`

``` purescript
clear :: JQuery -> Effect Unit
```

Remove child elements.

#### `before`

``` purescript
before :: JQuery -> JQuery -> Effect Unit
```

Insert an element before another.

#### `appendText`

``` purescript
appendText :: String -> JQuery -> Effect Unit
```

Append text as a child node.

#### `body`

``` purescript
body :: Effect JQuery
```

Get the document body node.

#### `getText`

``` purescript
getText :: JQuery -> Effect String
```

Get the text content of an element.

#### `setText`

``` purescript
setText :: String -> JQuery -> Effect Unit
```

Set the text content of an element.

#### `getHtml`

``` purescript
getHtml :: JQuery -> Effect String
```

Get the html content of an element.

#### `setHtml`

``` purescript
setHtml :: String -> JQuery -> Effect Unit
```

Set the html content of an element

#### `getValue`

``` purescript
getValue :: JQuery -> Effect Foreign
```

Get the value of a form element.

#### `setValue`

``` purescript
setValue :: forall a. a -> JQuery -> Effect Unit
```

Set the value of a form element.

#### `toggle`

``` purescript
toggle :: JQuery -> Effect Unit
```

Toggle visibility of an element.

#### `setVisible`

``` purescript
setVisible :: Boolean -> JQuery -> Effect Unit
```

Set the visibility of an element.

#### `hide`

``` purescript
hide :: JQuery -> Effect Unit
```

Hide elements.

#### `display`

``` purescript
display :: JQuery -> Effect Unit
```

Show elements.

#### `on`

``` purescript
on :: forall a. String -> (JQueryEvent -> JQuery -> Effect a) -> JQuery -> Effect Unit
```

Register an event handler.

#### `on'`

``` purescript
on' :: forall a. String -> Selector -> (JQueryEvent -> JQuery -> Effect a) -> JQuery -> Effect Unit
```

Register an event handler for elements matching a selector.

#### `off`

``` purescript
off :: String -> JQuery -> Effect Unit
```

Remove an event handler.

#### `off'`

``` purescript
off' :: JQuery -> Effect Unit
```

Remove all event handler.

#### `toArray`

``` purescript
toArray :: JQuery -> Effect (Array JQuery)
```

Get an array of matching elements.

#### `preventDefault`

``` purescript
preventDefault :: JQueryEvent -> Effect Unit
```

Prevent the default action for an event.

#### `stopPropagation`

``` purescript
stopPropagation :: JQueryEvent -> Effect Unit
```

Stop propagation an event.

#### `stopImmediatePropagation`

``` purescript
stopImmediatePropagation :: JQueryEvent -> Effect Unit
```

Stop immediate propagation an event.

#### `getTarget`

``` purescript
getTarget :: JQueryEvent -> Effect JQuery
```

Get the `target` propery of the event object.

#### `getCurrentTarget`

``` purescript
getCurrentTarget :: JQueryEvent -> Effect JQuery
```

Get the `currentTarget` property from the event object.

#### `getPageX`

``` purescript
getPageX :: JQueryEvent -> Effect Number
```

Get the `pageX` property from the event object.

#### `getPageY`

``` purescript
getPageY :: JQueryEvent -> Effect Number
```

Get the `pageY` property from the event object.

#### `getWhich`

``` purescript
getWhich :: JQueryEvent -> Effect Int
```

Get the `which` property from the event object.

#### `getMetaKey`

``` purescript
getMetaKey :: JQueryEvent -> Effect Boolean
```

Get the `metaKey` property from the event object.

#### `clone`

``` purescript
clone :: JQuery -> Effect JQuery
```

Create a deep copy of the set of matched elements.

#### `cloneWithDataAndEvents`

``` purescript
cloneWithDataAndEvents :: JQuery -> Effect JQuery
```

Create a deep copy of the set of matched elements,
including event handlers and element data.


