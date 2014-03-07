module Main where

import Data.Either
import Prelude
import Data.JSON
import Control.Monad.Eff
import Control.Monad.JQuery
import Debug.Trace

main = do
  -- Get the document body
  b <- body

  -- Create a text box
  div <- create "<div>"
  input <- create "<input>"
  "Your Name: " `appendText` div
  input `append` div
  div `append` b

  -- Create a paragraph to display a greeting
  greeting <- create "<p>"
  { color: "red" } `css` greeting
  greeting `append` b

  -- Listen for change events on the text box
  flip (on "change") input $ do
    Right name <- runParser readJSON <$> getValue input
    trace $ "Name changed to " ++ name
    setText ("Hello, " ++ name) greeting
