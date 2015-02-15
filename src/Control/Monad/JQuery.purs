module Control.Monad.JQuery where

import Data.Foreign
import Control.Monad.Eff
import DOM

-- The jQuery wrapper type
foreign import data JQuery :: *

-- Type of jQuery event objects
type JQueryEvent =
  { target :: Node
  , relatedTarget :: Node
  , pageX :: Number
  , pageY :: Number
  , which :: Number
  , metaKey :: Boolean
  }

-- $(document).ready(function() { ... })
foreign import ready
  """
  function ready(func) {
    return function () {
      jQuery(document).ready(func);
    };
  }
  """ :: forall eff a. Eff (dom :: DOM | eff) a -> Eff (dom :: DOM | eff) JQuery

-- Wrapper function for jQuery selection $('..')
foreign import select
  """
  function select(selector) {
    return function () {
      return jQuery(selector);
    };
  }
  """ :: forall eff. String -> Eff (dom :: DOM | eff) JQuery

-- .find(...)
foreign import find
  """
  function find(selector) {
    return function(ob) {
      return function () {
        return ob.find(selector);
      };
    };
  }
  """ :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) JQuery

-- .parent()
foreign import parent
  """
  function parent(ob) {
    return function () {
      return ob.parent();
    };
  }
  """ :: forall eff. JQuery -> Eff (dom :: DOM | eff) JQuery

-- .closest(...)
foreign import closest
  """
  function closest(selector) {
    return function(ob) {
      return function () {
        return ob.closest(selector);
      };
    };
  }
  """ :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) JQuery

-- Wrapper function for jQuery creation e.g. $('<div>')
foreign import create
  """
  function create(html) {
    return function () {
      return jQuery(html);
    };
  }
  """ :: forall eff. String -> Eff (dom :: DOM | eff) JQuery

-- .attr({ ... })
foreign import setAttr
  """
  function setAttr(attr) {
    return function(val) {
      return function(ob) {
        return function () {
          return ob.attr(attr, val);
        };
      };
    };
  }
  """ :: forall eff a. String -> a -> JQuery -> Eff (dom :: DOM | eff) JQuery

-- .attr({ ... })
foreign import attr
  """
  function attr(attrs) {
    return function(ob) {
      return function () {
        return ob.attr(attrs);
      };
    };
  }
  """ :: forall eff attr. { | attr } -> JQuery -> Eff (dom :: DOM | eff) JQuery

-- .css({ ... })
foreign import css
  """
  function css(props) {
    return function(ob) {
      return function () {
        return ob.css(props);
      };
    };
  }
  """ :: forall eff css. { | css } -> JQuery -> Eff (dom :: DOM | eff) JQuery

-- .hasClass(...)
foreign import hasClass
  """
  function hasClass(cls) {
    return function(ob) {
      return function () {
        return ob.hasClass(cls);
      };
    };
  }
  """ :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) Boolean

foreign import toggleClass
  """
  function toggleClass(cls) {
    return function(ob) {
      return function () {
        return ob.toggleClass(cls);
      };
    };
  }
  """ :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) JQuery

foreign import toggleClass'
  """
  function toggleClass$prime(cls) {
    return function(flag) {
      return function(ob) {
        return function () {
          return ob.toggleClass(cls, flag);
        };
      };
    };
  }
  """ :: forall eff. String -> Boolean -> JQuery -> Eff (dom :: DOM | eff) JQuery

addClass :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) JQuery
addClass cls = toggleClass' cls true

removeClass :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) JQuery
removeClass cls = toggleClass' cls false

-- .prop({ ... })
foreign import setProp
  """
  function setProp(p) {
    return function(val) {
      return function(ob) {
        return function () {
          return ob.prop(p, val);
        };
      };
    };
  }
  """ :: forall a eff. String -> a -> JQuery -> Eff (dom :: DOM | eff) JQuery

-- .prop({ ... })
foreign import getProp
  """
  function getProp(p) {
    return function(ob) {
      return function () {
        return ob.prop(p);
      };
    };
  }
  """ :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) Foreign

-- .append(...)
foreign import append
  """
  function append(ob1) {
    return function(ob) {
      return function () {
        return ob.append(ob1);
      };
    };
  }
  """ :: forall eff. JQuery -> JQuery -> Eff (dom :: DOM | eff) JQuery

foreign import appendAtIndex
  """
  function appendAtIndex(i) {
    return function(ob1) {
      return function(ob) {
        return function () {
          var children = ob.children();
          if (children.length > 0) {
            if (i <= 0) {
               ob.prepend(ob1);
            } else if (i >= children.length) {
               ob.append(ob1);
            } else {
               ob1.insertBefore(jQuery(children[i]));
            }
            return ob;
          } else {
            return ob.append(ob1);
          }
        };
      };
    };
  }
  """ :: forall eff. Number -> JQuery -> JQuery -> Eff (dom :: DOM | eff) JQuery

-- .remove()
foreign import remove
  """
  function remove(ob) {
    return function () {
      return ob.remove();
    };
  }
  """ :: forall eff. JQuery -> Eff (dom :: DOM | eff) JQuery

-- .empty()
foreign import clear
  """
  function clear(ob) {
    return function () {
      return ob.empty();
    };
  }
  """ :: forall eff. JQuery -> Eff (dom :: DOM | eff) JQuery

-- .before(...)
foreign import before
  """
  function before(ob) {
    return function(ob1) {
      return function () {
        return ob1.before(ob);
      };
    };
  }
  """ :: forall eff. JQuery -> JQuery -> Eff (dom :: DOM | eff) JQuery

-- .append(...)
foreign import appendText
  """
  function appendText(s) {
    return function(ob) {
      return function () {
        return ob.append(s);
      };
    };
  }
  """ :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) JQuery

-- Get the document body
foreign import body
  """
  function body() {
    return jQuery(document.body);
  }
  """ :: forall eff. Eff (dom :: DOM | eff) JQuery

-- Get the text content of an element
foreign import getText
  """
  function getText(ob) {
    return function() {
      return ob.text();
    };
  }
  """ :: forall eff. JQuery -> Eff (dom :: DOM | eff) String

-- Set the text content of an element
foreign import setText
  """
  function setText(text) {
    return function(ob) {
      return function() {
        return ob.text(text);
      };
    };
  }
  """ :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) JQuery

-- Get the value of a text field
foreign import getValue
  """
  function getValue(ob) {
    return function() {
      return ob.val();
    };
  }
  """ :: forall eff. JQuery -> Eff (dom :: DOM | eff) Foreign

-- Set the value of a text field
foreign import setValue
  """
  function setValue(val) {
    return function(ob) {
      return function() {
        return ob.val(val);
      };
    };
  }
  """ :: forall eff a. a -> JQuery -> Eff (dom :: DOM | eff) JQuery

foreign import toggle
  """
  function toggle(ob) {
    return function() {
      return ob.toggle();
    };
  }
  """ :: forall eff. JQuery -> Eff (dom :: DOM | eff) JQuery

foreign import toggle'
  """
  function toggle$prime(flag) {
    return function(ob) {
      return function() {
        return ob.toggle(flag);
      };
    };
  }
  """ :: forall eff. Boolean -> JQuery -> Eff (dom :: DOM | eff) JQuery

hide :: forall eff. JQuery -> Eff (dom :: DOM | eff) JQuery
hide = toggle' false

display :: forall eff. JQuery -> Eff (dom :: DOM | eff) JQuery
display = toggle' true

-- Register an event handler
foreign import on
  """
  function on(evt) {
    return function(act) {
      return function(ob) {
        return function() {
          return ob.on(evt, function(e) {
            act(e)(jQuery(this))();
          });
        };
      };
    };
  }
  """ :: forall eff a. String -> (JQueryEvent -> JQuery -> Eff (dom :: DOM | eff) a) -> JQuery ->
         Eff (dom :: DOM | eff) JQuery

-- Register an event handler
foreign import on'
  """
  function on$prime(evt) {
    return function(sel) {
      return function(act) {
        return function(ob) {
          return function() {
            return ob.on(evt, sel, function(e) {
              act(e)(jQuery(this))();
            });
          };
        };
      };
    };
  }
  """ :: forall eff a. String -> String -> (JQueryEvent -> JQuery -> Eff (dom :: DOM | eff) a) -> JQuery ->
         Eff (dom :: DOM | eff) JQuery

foreign import preventDefault
  """
  function preventDefault(e) {
    return function() {
      e.preventDefault();
    };
  }
  """ :: forall eff. JQueryEvent -> Eff (dom :: DOM | eff) Unit

foreign import stopPropagation
  """
  function stopPropagation(e) {
    return function() {
      e.stopPropagation();
    };
  }
  """ :: forall eff. JQueryEvent -> Eff (dom :: DOM | eff) Unit

foreign import stopImmediatePropagation
  """
  function stopImmediatePropagation(e) {
    return function() {
      e.stopImmediatePropagation();
    };
  }
  """ :: forall eff. JQueryEvent -> Eff (dom :: DOM | eff) Unit
