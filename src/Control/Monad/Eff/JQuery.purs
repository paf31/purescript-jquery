-- | This module defines foreign types and functions for working with
-- | the jQuery library.

module Control.Monad.Eff.JQuery
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
import Control.Monad.Eff (Eff)
import Data.Foreign (Foreign, isUndefined, unsafeFromForeign)
import DOM (DOM)
import Data.Functor (map)
import Data.Maybe (Maybe(..))

-- | The type of collections of jQuery-wrapped nodes.
foreign import data JQuery :: Type

-- | Type of jQuery event objects.
foreign import data JQueryEvent :: Type

-- | A type synonym to help readability of type signatures.
type Selector = String

-- | Run a function when the document is loaded.
foreign import ready
  :: forall eff a
   . Eff (dom :: DOM | eff) a
  -> Eff (dom :: DOM | eff) Unit

-- | Wrapper function for jQuery selection $('..')
foreign import select
  :: forall eff
   . Selector
  -> Eff (dom :: DOM | eff) JQuery

-- | Find child nodes matching a selector
foreign import find
  :: forall eff
   . Selector
  -> JQuery
  -> Eff (dom :: DOM | eff) JQuery

-- | Get the parent elements.
foreign import parent
  :: forall eff
   . JQuery
  -> Eff (dom :: DOM | eff) JQuery

-- | Find the closest element matching the selector.
foreign import closest
  :: forall eff
   . Selector
   -> JQuery
   -> Eff (dom :: DOM | eff) JQuery

-- | Create an element.
foreign import create
  :: forall eff
   . String
  -> Eff (dom :: DOM | eff) JQuery

-- | Set a single attribute.
foreign import setAttr
  :: forall eff a
   . String
  -> a
  -> JQuery
  -> Eff (dom :: DOM | eff) Unit

foreign import getAttrImpl
  :: forall eff
   . String
  -> JQuery
  -> Eff (dom :: DOM | eff) Foreign

-- | Get an attribute value.
getAttr 
  :: forall eff
   . String
   -> JQuery
   -> Eff (dom :: DOM | eff) (Maybe String)
getAttr str jq = map foreignToString (getAttrImpl str jq)
  where foreignToString f =
          if isUndefined f
            then Nothing
            else Just (unsafeFromForeign f)

-- | Set multiple attributes.
foreign import attr
  :: forall eff attr
   . { | attr }
  -> JQuery
  -> Eff (dom :: DOM | eff) Unit

-- | Set CSS properties.
foreign import css
  :: forall eff css
   . { | css }
  -> JQuery
  -> Eff (dom :: DOM | eff) Unit

-- | Test if an element has a CSS class.
foreign import hasClass
  :: forall eff
   . String
  -> JQuery
  -> Eff (dom :: DOM | eff) Boolean

-- | Toggle the specified CSS class.
foreign import toggleClass
  :: forall eff
   . String
  -> JQuery
  -> Eff (dom :: DOM | eff) Unit

-- | Set the specified CSS class.
foreign import setClass
  :: forall eff
   . String
  -> Boolean
  -> JQuery
  -> Eff (dom :: DOM | eff) Unit

-- | Add the specified CSS class.
addClass :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) Unit
addClass cls = setClass cls true

-- | Remove the specified CSS class.
removeClass :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) Unit
removeClass cls = setClass cls false

-- | Set a single property.
foreign import setProp
  :: forall a eff
   . String
  -> a
  -> JQuery
  -> Eff (dom :: DOM | eff) Unit

-- | Get a property value.
foreign import getProp
  :: forall eff
   . String
  -> JQuery
  -> Eff (dom :: DOM | eff) Foreign

-- | Append the first node as a child node of the second.
foreign import append
  :: forall eff
   . JQuery
  -> JQuery
  -> Eff (dom :: DOM | eff) Unit

-- | Remove selected elements.
foreign import remove
  :: forall eff
   . JQuery
  -> Eff (dom :: DOM | eff) Unit

-- | Remove child elements.
foreign import clear
  :: forall eff
   . JQuery
  -> Eff (dom :: DOM | eff) Unit

-- | Insert an element before another.
foreign import before
  :: forall eff
   . JQuery
  -> JQuery -> Eff (dom :: DOM | eff) Unit

-- | Append text as a child node.
foreign import appendText
  :: forall eff
   . String
  -> JQuery -> Eff (dom :: DOM | eff) Unit

-- | Get the document body node.
foreign import body
  :: forall eff
   . Eff (dom :: DOM | eff) JQuery

-- | Get the text content of an element.
foreign import getText
  :: forall eff
   . JQuery
  -> Eff (dom :: DOM | eff) String

-- | Set the text content of an element.
foreign import setText
  :: forall eff
   . String
  -> JQuery
  -> Eff (dom :: DOM | eff) Unit

-- | Get the html content of an element.
foreign import getHtml
  :: forall eff
   . JQuery
  -> Eff (dom :: DOM | eff) String

-- | Set the html content of an element
foreign import setHtml
  :: forall eff
   . String
  -> JQuery
  -> Eff (dom :: DOM | eff) Unit

-- | Get the value of a form element.
foreign import getValue
  :: forall eff
   . JQuery
  -> Eff (dom :: DOM | eff) Foreign

-- | Set the value of a form element.
foreign import setValue
  :: forall eff a
   . a
  -> JQuery
  -> Eff (dom :: DOM | eff) Unit

-- | Toggle visibility of an element.
foreign import toggle
  :: forall eff
   . JQuery
  -> Eff (dom :: DOM | eff) Unit

-- | Set the visibility of an element.
foreign import setVisible
  :: forall eff
   . Boolean
 -> JQuery
 -> Eff (dom :: DOM | eff) Unit

-- | Hide elements.
hide
  :: forall eff
   . JQuery
  -> Eff (dom :: DOM | eff) Unit
hide = setVisible false

-- | Show elements.
display
  :: forall eff
   . JQuery
  -> Eff (dom :: DOM | eff) Unit
display = setVisible true

-- | Register an event handler.
foreign import on
  :: forall eff a
   . String
   -> (JQueryEvent -> JQuery -> Eff (dom :: DOM | eff) a)
   -> JQuery
   -> Eff (dom :: DOM | eff) Unit

-- | Register an event handler for elements matching a selector.
foreign import on'
  :: forall eff a
   . String
  -> Selector
  -> (JQueryEvent -> JQuery -> Eff (dom :: DOM | eff) a)
  -> JQuery
  -> Eff (dom :: DOM | eff) Unit

-- | Remove an event handler.
foreign import off
  :: forall eff a
   . String
   -> JQuery
   -> Eff (dom :: DOM | eff) Unit

-- | Remove all event handler.
foreign import off'
  :: forall eff a
   . JQuery
   -> Eff (dom :: DOM | eff) Unit

-- | Get an array of matching elements.
foreign import toArray
  :: forall eff
   . JQuery
  -> Eff (dom :: DOM | eff) (Array JQuery)

-- | Prevent the default action for an event.
foreign import preventDefault
  :: forall eff
   . JQueryEvent
  -> Eff (dom :: DOM | eff) Unit

-- | Stop propagation an event.
foreign import stopPropagation
  :: forall eff
   . JQueryEvent
  -> Eff (dom :: DOM | eff) Unit

-- | Stop immediate propagation an event.
foreign import stopImmediatePropagation
  :: forall eff
   . JQueryEvent
  -> Eff (dom :: DOM | eff) Unit

-- | Get the `target` propery of the event object.
foreign import getTarget
  :: forall eff
   . JQueryEvent
  -> Eff (dom :: DOM | eff) JQuery

-- | Get the `currentTarget` property from the event object.
foreign import getCurrentTarget
  :: forall eff
   . JQueryEvent
  -> Eff (dom :: DOM | eff) JQuery

-- | Get the `pageX` property from the event object.
foreign import getPageX
  :: forall eff
   . JQueryEvent
  -> Eff (dom :: DOM | eff) Number

-- | Get the `pageY` property from the event object.
foreign import getPageY
  :: forall eff
   . JQueryEvent
  -> Eff (dom :: DOM | eff) Number

-- | Get the `which` property from the event object.
foreign import getWhich
  :: forall eff
   . JQueryEvent
  -> Eff (dom :: DOM | eff) Int

-- | Get the `metaKey` property from the event object.
foreign import getMetaKey
  :: forall eff
   . JQueryEvent
  -> Eff (dom :: DOM | eff) Boolean

-- | Create a deep copy of the set of matched elements.
foreign import clone
  :: forall eff
   . JQuery
  -> Eff (dom :: DOM | eff) JQuery

-- | Create a deep copy of the set of matched elements,
-- | including event handlers and element data.
foreign import cloneWithDataAndEvents
  :: forall eff
   . JQuery
  -> Eff (dom :: DOM | eff) JQuery
