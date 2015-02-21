# Module Documentation

## Module Control.Monad.JQuery

#### `JQuery`

``` purescript
data JQuery :: *
```

#### `JQueryEvent`

``` purescript
data JQueryEvent :: *
```

#### `ready`

``` purescript
ready :: forall eff a. Eff (dom :: DOM | eff) a -> Eff (dom :: DOM | eff) JQuery
```

#### `select`

``` purescript
select :: forall eff. String -> Eff (dom :: DOM | eff) JQuery
```

#### `find`

``` purescript
find :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) JQuery
```

#### `parent`

``` purescript
parent :: forall eff. JQuery -> Eff (dom :: DOM | eff) JQuery
```

#### `closest`

``` purescript
closest :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) JQuery
```

#### `create`

``` purescript
create :: forall eff. String -> Eff (dom :: DOM | eff) JQuery
```

#### `setAttr`

``` purescript
setAttr :: forall eff a. String -> a -> JQuery -> Eff (dom :: DOM | eff) JQuery
```

#### `attr`

``` purescript
attr :: forall eff attr. {  | attr } -> JQuery -> Eff (dom :: DOM | eff) JQuery
```

#### `css`

``` purescript
css :: forall eff css. {  | css } -> JQuery -> Eff (dom :: DOM | eff) JQuery
```

#### `hasClass`

``` purescript
hasClass :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) Boolean
```

#### `toggleClass`

``` purescript
toggleClass :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) JQuery
```


#### `toggleClass'`

``` purescript
toggleClass' :: forall eff. String -> Boolean -> JQuery -> Eff (dom :: DOM | eff) JQuery
```


#### `addClass`

``` purescript
addClass :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) JQuery
```


#### `removeClass`

``` purescript
removeClass :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) JQuery
```


#### `setProp`

``` purescript
setProp :: forall a eff. String -> a -> JQuery -> Eff (dom :: DOM | eff) JQuery
```

#### `getProp`

``` purescript
getProp :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) Foreign
```

#### `append`

``` purescript
append :: forall eff. JQuery -> JQuery -> Eff (dom :: DOM | eff) JQuery
```

#### `appendAtIndex`

``` purescript
appendAtIndex :: forall eff. Number -> JQuery -> JQuery -> Eff (dom :: DOM | eff) JQuery
```


#### `remove`

``` purescript
remove :: forall eff. JQuery -> Eff (dom :: DOM | eff) JQuery
```

#### `clear`

``` purescript
clear :: forall eff. JQuery -> Eff (dom :: DOM | eff) JQuery
```

#### `before`

``` purescript
before :: forall eff. JQuery -> JQuery -> Eff (dom :: DOM | eff) JQuery
```

#### `appendText`

``` purescript
appendText :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) JQuery
```

#### `body`

``` purescript
body :: forall eff. Eff (dom :: DOM | eff) JQuery
```

#### `getText`

``` purescript
getText :: forall eff. JQuery -> Eff (dom :: DOM | eff) String
```

#### `setText`

``` purescript
setText :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) JQuery
```

#### `getValue`

``` purescript
getValue :: forall eff. JQuery -> Eff (dom :: DOM | eff) Foreign
```

#### `setValue`

``` purescript
setValue :: forall eff a. a -> JQuery -> Eff (dom :: DOM | eff) JQuery
```

#### `toggle`

``` purescript
toggle :: forall eff. JQuery -> Eff (dom :: DOM | eff) JQuery
```


#### `toggle'`

``` purescript
toggle' :: forall eff. Boolean -> JQuery -> Eff (dom :: DOM | eff) JQuery
```


#### `hide`

``` purescript
hide :: forall eff. JQuery -> Eff (dom :: DOM | eff) JQuery
```


#### `display`

``` purescript
display :: forall eff. JQuery -> Eff (dom :: DOM | eff) JQuery
```


#### `on`

``` purescript
on :: forall eff a. String -> (JQueryEvent -> JQuery -> Eff (dom :: DOM | eff) a) -> JQuery -> Eff (dom :: DOM | eff) JQuery
```

#### `on'`

``` purescript
on' :: forall eff a. String -> String -> (JQueryEvent -> JQuery -> Eff (dom :: DOM | eff) a) -> JQuery -> Eff (dom :: DOM | eff) JQuery
```

#### `preventDefault`

``` purescript
preventDefault :: forall eff. JQueryEvent -> Eff (dom :: DOM | eff) Unit
```


#### `stopPropagation`

``` purescript
stopPropagation :: forall eff. JQueryEvent -> Eff (dom :: DOM | eff) Unit
```


#### `stopImmediatePropagation`

``` purescript
stopImmediatePropagation :: forall eff. JQueryEvent -> Eff (dom :: DOM | eff) Unit
```