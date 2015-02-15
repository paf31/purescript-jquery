# Module Documentation

## Module Control.Monad.JQuery

### Types

     The jQuery wrapper type

    data JQuery :: *

     Type of jQuery event objects

    type JQueryEvent = { metaKey :: Boolean, which :: Number, pageY :: Number, pageX :: Number, relatedTarget :: Node, target :: Node }


### Values


    addClass :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) JQuery

     .append(...)

    append :: forall eff. JQuery -> JQuery -> Eff (dom :: DOM | eff) JQuery


    appendAtIndex :: forall eff. Number -> JQuery -> JQuery -> Eff (dom :: DOM | eff) JQuery

     .append(...)

    appendText :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) JQuery

     .attr({ ... })

    attr :: forall eff attr. {  | attr } -> JQuery -> Eff (dom :: DOM | eff) JQuery

     .before(...)

    before :: forall eff. JQuery -> JQuery -> Eff (dom :: DOM | eff) JQuery

     Get the document body

    body :: forall eff. Eff (dom :: DOM | eff) JQuery

     .empty()

    clear :: forall eff. JQuery -> Eff (dom :: DOM | eff) JQuery

     .closest(...)

    closest :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) JQuery

     Wrapper function for jQuery creation e.g. $('<div>')

    create :: forall eff. String -> Eff (dom :: DOM | eff) JQuery

     .css({ ... })

    css :: forall eff css. {  | css } -> JQuery -> Eff (dom :: DOM | eff) JQuery


    display :: forall eff. JQuery -> Eff (dom :: DOM | eff) JQuery

     .find(...)

    find :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) JQuery

     .prop({ ... })

    getProp :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) Foreign

     Get the text content of an element

    getText :: forall eff. JQuery -> Eff (dom :: DOM | eff) String

     Get the value of a text field

    getValue :: forall eff. JQuery -> Eff (dom :: DOM | eff) Foreign

     .hasClass(...)

    hasClass :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) Boolean


    hide :: forall eff. JQuery -> Eff (dom :: DOM | eff) JQuery

     Register an event handler

    on :: forall eff a. String -> (JQueryEvent -> JQuery -> Eff (dom :: DOM | eff) a) -> JQuery -> Eff (dom :: DOM | eff) JQuery

     Register an event handler

    on' :: forall eff a. String -> String -> (JQueryEvent -> JQuery -> Eff (dom :: DOM | eff) a) -> JQuery -> Eff (dom :: DOM | eff) JQuery

     .parent()

    parent :: forall eff. JQuery -> Eff (dom :: DOM | eff) JQuery


    preventDefault :: forall eff. JQueryEvent -> Eff (dom :: DOM | eff) Unit

     $(document).ready(function() { ... })

    ready :: forall eff a. Eff (dom :: DOM | eff) a -> Eff (dom :: DOM | eff) JQuery

     .remove()

    remove :: forall eff. JQuery -> Eff (dom :: DOM | eff) JQuery


    removeClass :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) JQuery

     Wrapper function for jQuery selection $('..')

    select :: forall eff. String -> Eff (dom :: DOM | eff) JQuery

     .attr({ ... })

    setAttr :: forall eff a. String -> a -> JQuery -> Eff (dom :: DOM | eff) JQuery

     .prop({ ... })

    setProp :: forall a eff. String -> a -> JQuery -> Eff (dom :: DOM | eff) JQuery

     Set the text content of an element

    setText :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) JQuery

     Set the value of a text field

    setValue :: forall eff a. a -> JQuery -> Eff (dom :: DOM | eff) JQuery


    stopImmediatePropagation :: forall eff. JQueryEvent -> Eff (dom :: DOM | eff) Unit


    stopPropagation :: forall eff. JQueryEvent -> Eff (dom :: DOM | eff) Unit


    toggle :: forall eff. JQuery -> Eff (dom :: DOM | eff) JQuery


    toggle' :: forall eff. Boolean -> JQuery -> Eff (dom :: DOM | eff) JQuery


    toggleClass :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) JQuery


    toggleClass' :: forall eff. String -> Boolean -> JQuery -> Eff (dom :: DOM | eff) JQuery