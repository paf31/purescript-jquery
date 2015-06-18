module Test.Main where

import Prelude

import Data.Either
import Data.Foreign
import Data.Foreign.Class

import Control.Monad.Eff
import Control.Monad.Eff.Console

import qualified Control.Monad.JQuery as J

main = J.ready $ do
  -- Get the document body
  body <- J.body

  -- Create a text box
  div   <- J.create "<div>"
  input <- J.create "<input>"
  J.appendText "Your Name: " div
  J.append input div
  J.append div body

  -- Create a paragraph to display a greeting
  greeting <- J.create "<p>"
  J.css { color: "red" } greeting
  J.append greeting body

  -- Listen for change events on the text box
  J.on "change" (handleChange input greeting) input 
  where
  handleChange input greeting _ _ = do
    Right name <- read <$> J.getValue input
    log $ "Name changed to " ++ name
    J.setText ("Hello, " ++ name) greeting
