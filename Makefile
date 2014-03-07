deps:
	git clone git@github.com:purescript/purescript-json.git

all: lib test

lib:
	mkdir -p js/Control/Monad/
	psc purescript-json/src/Data.JSON.purs src/Control/Monad/JQuery.purs.hs examples/test.purs.hs \
	  -o js/Control/Monad/JQuery.js \
	  -e js/Control/Monad/JQuery.e.purs.hs \
	  --magic-do --module Control.Monad.JQuery --module Data.Either

test:
	mkdir -p js/
	psc purescript-json/src/Data.JSON.purs src/Control/Monad/JQuery.purs.hs examples/test.purs.hs \
	  -o js/test.js \
	  --magic-do --main --module Main --module Data.Either

