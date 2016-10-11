module Test.Main where

import Prelude hiding (append)

import Data.Either (Either(..))
import Data.Foreign.Class (read)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)
import Control.Monad.Eff.JQuery (JQuery, HTML, JQueryEvent, on, append, css, create, appendText, body, ready, setText, getValue)
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
      :: (JQuery HTML)
      -> (JQuery HTML)
      -> JQueryEvent
      -> (JQuery HTML)
      -> Eff ( dom :: DOM
             , console :: CONSOLE
             | eff
             ) Unit
    handleChange input greeting _ _ = unsafePartial do
      Right name <- read <$> getValue input
      log $ "Name changed to " <> name
      setText ("Hello, " <> name) greeting
