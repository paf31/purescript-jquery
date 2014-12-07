# Module Documentation

## Module Control.Monad.JQuery

### Types

    data JQuery :: *

    data JQueryEvent :: *


### Values

    addClass :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) JQuery

    append :: forall eff. JQuery -> JQuery -> Eff (dom :: DOM | eff) JQuery

    appendAtIndex :: forall eff. Number -> JQuery -> JQuery -> Eff (dom :: DOM | eff) JQuery

    appendText :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) JQuery

    attr :: forall eff attr. {  | attr } -> JQuery -> Eff (dom :: DOM | eff) JQuery

    before :: forall eff. JQuery -> JQuery -> Eff (dom :: DOM | eff) JQuery

    body :: forall eff. Eff (dom :: DOM | eff) JQuery

    clear :: forall eff. JQuery -> Eff (dom :: DOM | eff) JQuery

    closest :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) JQuery

    create :: forall eff. String -> Eff (dom :: DOM | eff) JQuery

    css :: forall eff css. {  | css } -> JQuery -> Eff (dom :: DOM | eff) JQuery

    display :: forall eff. JQuery -> Eff (dom :: DOM | eff) JQuery

    find :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) JQuery

    getProp :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) Foreign

    getText :: forall eff. JQuery -> Eff (dom :: DOM | eff) String

    getValue :: forall eff. JQuery -> Eff (dom :: DOM | eff) Foreign

    hasClass :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) Boolean

    hide :: forall eff. JQuery -> Eff (dom :: DOM | eff) JQuery

    on :: forall eff a. String -> (JQueryEvent -> JQuery -> Eff (dom :: DOM | eff) a) -> JQuery -> Eff (dom :: DOM | eff) JQuery

    on' :: forall eff a. String -> String -> (JQueryEvent -> JQuery -> Eff (dom :: DOM | eff) a) -> JQuery -> Eff (dom :: DOM | eff) JQuery

    parent :: forall eff. JQuery -> Eff (dom :: DOM | eff) JQuery

    preventDefault :: forall eff. JQueryEvent -> Eff (dom :: DOM | eff) Unit

    ready :: forall eff a. Eff (dom :: DOM | eff) a -> Eff (dom :: DOM | eff) JQuery

    remove :: forall eff. JQuery -> Eff (dom :: DOM | eff) JQuery

    removeClass :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) JQuery

    select :: forall eff. String -> Eff (dom :: DOM | eff) JQuery

    setAttr :: forall eff a. String -> a -> JQuery -> Eff (dom :: DOM | eff) JQuery

    setProp :: forall a eff. String -> a -> JQuery -> Eff (dom :: DOM | eff) JQuery

    setText :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) JQuery

    setValue :: forall eff a. a -> JQuery -> Eff (dom :: DOM | eff) JQuery

    stopImmediatePropagation :: forall eff. JQueryEvent -> Eff (dom :: DOM | eff) Unit

    stopPropagation :: forall eff. JQueryEvent -> Eff (dom :: DOM | eff) Unit

    toggle :: forall eff. JQuery -> Eff (dom :: DOM | eff) JQuery

    toggle' :: forall eff. Boolean -> JQuery -> Eff (dom :: DOM | eff) JQuery