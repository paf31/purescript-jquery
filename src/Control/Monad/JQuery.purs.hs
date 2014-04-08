module Control.Monad.JQuery where

import Prelude ()
import Data.Foreign
import Control.Monad.Eff

-- An effect type which indicates DOM manipulation
foreign import data DOM :: !

-- The jQuery wrapper type
foreign import data JQuery :: *

-- Wrapper function for jQuery selection $('..')
foreign import select 
  "function select(selector) { \
  \  return function () { \
  \    return jQuery(selector); \
  \  }; \
  \}" :: forall eff. String -> Eff (dom :: DOM | eff) JQuery

-- Wrapper function for jQuery creation e.g. $('<div>')
foreign import create 
  "function create(html) { \
  \  return function () { \
  \    return jQuery(html); \
  \  }; \
  \}" :: forall eff. String -> Eff (dom :: DOM | eff) JQuery

-- .attr({ ... })
foreign import setAttr 
  "function setAttr(attr) { \
  \  return function(val) { \
  \    return function(ob) { \
  \      return function () { \
  \        return ob.attr(attr, val);\
  \      }; \
  \    }; \
  \  }; \
  \}" :: forall eff a. String -> a -> JQuery -> Eff (dom :: DOM | eff) JQuery

-- .attr({ ... })
foreign import attr 
  "function attr(attrs) { \
  \  return function(ob) { \
  \    return function () { \
  \      return ob.attr(attrs);\
  \    }; \
  \  }; \
  \}" :: forall eff attr. { | attr } -> JQuery -> Eff (dom :: DOM | eff) JQuery

-- .css({ ... })
foreign import css
  "function css(props) { \
  \  return function(ob) { \
  \    return function () { \
  \      return ob.css(props); \
  \    }; \
  \  }; \
  \}" :: forall eff css. { | css } -> JQuery -> Eff (dom :: DOM | eff) JQuery

-- .prop({ ... })
foreign import setProp 
  "function setProp(p) { \
  \  return function(val) { \
  \    return function(ob) { \
  \      return function () { \
  \        return ob.prop(p, val);\
  \      }; \
  \    }; \
  \  }; \
  \}" :: forall a eff. String -> a -> JQuery -> Eff (dom :: DOM | eff) JQuery

-- .prop({ ... })
foreign import getProp 
  "function getProp(p) { \
  \  return function(ob) { \
  \    return function () { \
  \      return ob.prop(p);\
  \    }; \
  \  }; \
  \}" :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) Foreign

-- .append(...)
foreign import append 
  "function append(ob1) { \
  \  return function(ob) { \
  \    return function () { \
  \      return ob.append(ob1); \
  \    }; \
  \  }; \
  \}" :: forall eff. JQuery -> JQuery -> Eff (dom :: DOM | eff) JQuery

foreign import appendAtIndex
  "function appendAtIndex(i) { \ 
  \  return function(ob1) { \
  \    return function(ob) { \
  \      return function () { \
  \        var children = ob.children();\
  \        if (children.length > 0) {\
  \          if (i <= 0) {\
  \             ob.prepend(ob1);\
  \          } else if (i >= children.length) {\
  \             ob.append(ob1);\
  \          } else {\
  \             ob1.insertBefore(jQuery(children[i]));\
  \          }\
  \          return ob;\
  \        } else {\
  \          return ob.append(ob1); \
  \        }\
  \      }; \
  \    }; \
  \  }; \
  \}" :: forall eff. Number -> JQuery -> JQuery -> Eff (dom :: DOM | eff) JQuery

-- .remove()
foreign import remove 
  "function remove(ob) { \
  \  return function () { \
  \    return ob.remove(); \
  \  }; \
  \}" :: forall eff. JQuery -> Eff (dom :: DOM | eff) JQuery

-- .before(...)
foreign import before 
  "function before(ob) { \
  \  return function(ob1) { \
  \    return function () { \
  \      return ob1.before(ob); \
  \    }; \
  \  }; \
  \}" :: forall eff. JQuery -> JQuery -> Eff (dom :: DOM | eff) JQuery

-- .append(...)
foreign import appendText 
  "function appendText(s) { \
  \  return function(ob) { \
  \    return function () { \
  \      return ob.append(s); \
  \    }; \
  \  }; \
  \}" :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) JQuery

-- Get the document body
foreign import body 
  "function body() { \
  \  return jQuery(document.body); \
  \}" :: forall eff. Eff (dom :: DOM | eff) JQuery

-- Get the text content of an element
foreign import getText 
  "function getText(ob) { \
  \  return function() { \
  \    return ob.text(); \
  \  }; \
  \}" :: forall eff. JQuery -> Eff (dom :: DOM | eff) String

-- Set the text content of an element
foreign import setText 
  "function setText(text) { \
  \  return function(ob) { \
  \    return function() { \
  \      ob.text(text); \
  \    };\
  \  };\
  \}" :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) JQuery

-- Get the value of a text field
foreign import getValue 
  "function getValue(ob) { \
  \  return function() { \
  \    return ob.val(); \
  \  }; \
  \}" :: forall eff. JQuery -> Eff (dom :: DOM | eff) Foreign

-- Set the value of a text field
foreign import setValue 
  "function setValue(val) { \
  \  return function(ob) { \
  \    return function() { \
  \      return ob.val(val); \
  \    }; \
  \  }; \
  \}" :: forall eff a. a -> JQuery -> Eff (dom :: DOM | eff) JQuery

-- Register an event handler
foreign import on 
  "function on(evt) { \
  \  return function(act) { \
  \    return function(ob) { \
  \      return function() { \
  \        return ob.on(evt, function() { \
  \          act(jQuery(this))(); \
  \        }); \
  \      }; \
  \    }; \
  \  }; \
  \}" :: forall eff a. String -> (JQuery -> Eff eff a) -> JQuery ->
         Eff (dom :: DOM | eff) JQuery
