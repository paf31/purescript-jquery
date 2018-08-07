# purescript-jquery

[![Latest release](http://img.shields.io/bower/v/purescript-jquery.svg)](https://github.com/purescript-contrib/purescript-jquery/releases)
[![Maintainer: paf31](https://img.shields.io/badge/maintainer-paf31-lightgrey.svg)](http://github.com/paf31)

PureScript type declarations for jQuery.

- [Module Documentation](generated-docs/JQuery.md) or on [Pursuit](https://pursuit.purescript.org/packages/purescript-jquery)

## Example

```purs
main =
  ready $ do
    -- Get the document body
    body <- body

    -- Create a text box
    div   <- create "<div>"
    input <- create "<input>"
    appendText "Your Name: " div
    append input div
    append div body

    -- Create a paragraph to display a greeting
    greeting <- create "<p>"
    css { color: "red" } greeting
    append greeting body

    -- Listen for change events on the text box
    on "change" (handleChange input greeting) input
  where
    handleChange :: JQuery -> JQuery -> JQueryEvent -> JQuery -> Effect Unit
    handleChange input greeting _ _ = unsafePartial do
      val <- getValue input
      for_ (runExcept (readString val)) \name -> do
        log $ "Name changed to " <> name
        setText ("Hello, " <> name) greeting
```

from [test/Main.purs](test/Main.purs)

## Installation

    bower i purescript-jquery
