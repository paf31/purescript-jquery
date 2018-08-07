-- | This module defines foreign types and functions for working with
-- | the jQuery library.

module JQuery
  ( JQuery
  , JQueryEvent
  , Selector
  , ready
  , select
  , find
  , parent
  , closest
  , create
  , setAttr
  , getAttr
  , attr
  , css
  , hasClass
  , toggleClass
  , setClass
  , addClass
  , removeClass
  , setProp
  , getProp
  , append
  , remove
  , clear
  , before
  , appendText
  , body
  , getText
  , setText
  , getHtml
  , setHtml
  , getValue
  , setValue
  , toggle
  , setVisible
  , hide
  , display
  , on
  , on'
  , off
  , off'
  , toArray
  , preventDefault
  , stopPropagation
  , stopImmediatePropagation
  , getTarget
  , getCurrentTarget
  , getPageX
  , getPageY
  , getWhich
  , getMetaKey
  , clone
  , cloneWithDataAndEvents
  ) where

import Prelude (Unit)
import Effect (Effect)
import Foreign (Foreign, isUndefined, unsafeFromForeign)
import Data.Functor (map)
import Data.Maybe (Maybe(..))

-- | The type of collections of jQuery-wrapped nodes.
foreign import data JQuery :: Type

-- | Type of jQuery event objects.
foreign import data JQueryEvent :: Type

-- | A type synonym to help readability of type signatures.
type Selector = String

-- | Run a function when the document is loaded.
foreign import ready :: forall a. Effect a -> Effect Unit

-- | Wrapper function for jQuery selection $('..')
foreign import select :: Selector -> Effect JQuery

-- | Find child nodes matching a selector
foreign import find :: Selector -> JQuery -> Effect JQuery

-- | Get the parent elements.
foreign import parent :: JQuery -> Effect JQuery

-- | Find the closest element matching the selector.
foreign import closest :: Selector -> JQuery -> Effect JQuery

-- | Create an element.
foreign import create :: String -> Effect JQuery

-- | Set a single attribute.
foreign import setAttr :: forall a. String -> a -> JQuery -> Effect Unit

foreign import getAttrImpl :: String -> JQuery -> Effect Foreign

-- | Get an attribute value.
getAttr :: String -> JQuery -> Effect (Maybe String)
getAttr str jq = map foreignToString (getAttrImpl str jq)
  where foreignToString f =
          if isUndefined f
            then Nothing
            else Just (unsafeFromForeign f)

-- | Set multiple attributes.
foreign import attr :: forall attr. { | attr } -> JQuery -> Effect Unit

-- | Set CSS properties.
foreign import css :: forall css. { | css } -> JQuery -> Effect Unit

-- | Test if an element has a CSS class.
foreign import hasClass :: String -> JQuery -> Effect Boolean

-- | Toggle the specified CSS class.
foreign import toggleClass :: String -> JQuery -> Effect Unit

-- | Set the specified CSS class.
foreign import setClass :: String -> Boolean -> JQuery -> Effect Unit

-- | Add the specified CSS class.
addClass :: String -> JQuery -> Effect Unit
addClass cls = setClass cls true

-- | Remove the specified CSS class.
removeClass :: String -> JQuery -> Effect Unit
removeClass cls = setClass cls false

-- | Set a single property.
foreign import setProp :: forall a. String -> a -> JQuery -> Effect Unit

-- | Get a property value.
foreign import getProp :: String -> JQuery -> Effect Foreign

-- | Append the first node as a child node of the second.
foreign import append :: JQuery -> JQuery -> Effect Unit

-- | Remove selected elements.
foreign import remove :: JQuery -> Effect Unit

-- | Remove child elements.
foreign import clear :: JQuery -> Effect Unit

-- | Insert an element before another.
foreign import before :: JQuery -> JQuery -> Effect Unit

-- | Append text as a child node. Importantly, if jQuery recognises the String
-- | as HTML, the parsed HTML will be appended, rather than the string. Hence,
-- | this function can be dangerous when dealing with unchecked user input.
foreign import unsafeAppendHtml :: String -> JQuery -> Effect Unit

-- | Append text as a child node.
foreign import appendText :: String -> JQuery -> Effect Unit

-- | Get the document body node.
foreign import body :: Effect JQuery

-- | Get the text content of an element.
foreign import getText :: JQuery -> Effect String

-- | Set the text content of an element.
foreign import setText :: String -> JQuery -> Effect Unit

-- | Get the html content of an element.
foreign import getHtml :: JQuery -> Effect String

-- | Set the html content of an element
foreign import setHtml :: String -> JQuery -> Effect Unit

-- | Get the value of a form element.
foreign import getValue :: JQuery -> Effect Foreign

-- | Set the value of a form element.
foreign import setValue :: forall a. a -> JQuery -> Effect Unit

-- | Toggle visibility of an element.
foreign import toggle :: JQuery -> Effect Unit

-- | Set the visibility of an element.
foreign import setVisible :: Boolean -> JQuery -> Effect Unit

-- | Hide elements.
hide :: JQuery -> Effect Unit
hide = setVisible false

-- | Show elements.
display :: JQuery -> Effect Unit
display = setVisible true

-- | Register an event handler.
foreign import on :: forall a. String -> (JQueryEvent -> JQuery -> Effect a) -> JQuery -> Effect Unit

-- | Register an event handler for elements matching a selector.
foreign import on':: forall a. String -> Selector -> (JQueryEvent -> JQuery -> Effect a) -> JQuery -> Effect Unit

-- | Remove an event handler.
foreign import off :: String -> JQuery -> Effect Unit

-- | Remove all event handler.
foreign import off':: JQuery -> Effect Unit

-- | Get an array of matching elements.
foreign import toArray :: JQuery -> Effect (Array JQuery)

-- | Prevent the default action for an event.
foreign import preventDefault :: JQueryEvent -> Effect Unit

-- | Stop propagation an event.
foreign import stopPropagation :: JQueryEvent -> Effect Unit

-- | Stop immediate propagation an event.
foreign import stopImmediatePropagation :: JQueryEvent -> Effect Unit

-- | Get the `target` propery of the event object.
foreign import getTarget :: JQueryEvent -> Effect JQuery

-- | Get the `currentTarget` property from the event object.
foreign import getCurrentTarget :: JQueryEvent -> Effect JQuery

-- | Get the `pageX` property from the event object.
foreign import getPageX :: JQueryEvent -> Effect Number

-- | Get the `pageY` property from the event object.
foreign import getPageY :: JQueryEvent -> Effect Number

-- | Get the `which` property from the event object.
foreign import getWhich :: JQueryEvent -> Effect Int

-- | Get the `metaKey` property from the event object.
foreign import getMetaKey :: JQueryEvent -> Effect Boolean

-- | Create a deep copy of the set of matched elements.
foreign import clone :: JQuery -> Effect JQuery

-- | Create a deep copy of the set of matched elements,
-- | including event handlers and element data.
foreign import cloneWithDataAndEvents :: JQuery -> Effect JQuery
