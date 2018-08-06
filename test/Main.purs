module Test.Main where

import Prelude hiding (append)

import Effect (Effect)
import Effect.Console (log)
import JQuery (JQuery, JQueryEvent, on, append, css, create, appendText, body, ready, setText, getValue)
import Control.Monad.Except (runExcept)
import Foreign (readString)
import Data.Foldable (for_)
import Partial.Unsafe (unsafePartial)

main :: Effect Unit
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
