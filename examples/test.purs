module Main where

import Data.Either
import Prelude
import Data.Foreign
import Data.Foreign.Class
import Control.Monad.Eff
import qualified Control.Monad.JQuery as J
import Debug.Trace

main = J.ready $ do
  -- Get the document body
  b <- J.body

  -- Create a text box
  div <- J.create "<div>"
  input <- J.create "<input>"
  "Your Name: " `J.appendText` div
  input `J.append` div
  div `J.append` b

  -- Create a paragraph to display a greeting
  greeting <- J.create "<p>"
  { color: "red" } `J.css` greeting
  greeting `J.append` b

  -- Listen for change events on the text box
  flip (J.on "change") input $ \_ _ -> do
    Right name <- read <$> J.getValue input
    trace $ "Name changed to " ++ name
    J.setText ("Hello, " ++ name) greeting
