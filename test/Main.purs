module Test.Main where

import Prelude hiding (append)

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)
import Control.Monad.Eff.JQuery (JQuery, JQueryEvent, on, append, css, create, appendText, body, ready, setText, getValue)
import Control.Monad.Except (runExcept)
import Data.Foreign (readString)
import Data.Foldable (for_)
import DOM (DOM)
import Partial.Unsafe (unsafePartial)

main :: forall eff. Eff ( dom :: DOM
                        , console :: CONSOLE
                        | eff
                        ) Unit
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
    handleChange
      :: JQuery
      -> JQuery
      -> JQueryEvent
      -> JQuery
      -> Eff ( dom :: DOM
             , console :: CONSOLE
             | eff
             ) Unit
    handleChange input greeting _ _ = unsafePartial do
      val <- getValue input
      for_ (runExcept (readString val)) \name -> do
        log $ "Name changed to " <> name
        setText ("Hello, " <> name) greeting
