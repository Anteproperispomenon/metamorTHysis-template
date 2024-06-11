{-# LANGUAGE TemplateHaskell #-}

module Main (main) where

import Server

import Metamorth.Server.CLI

-- This function auto-generates the code for
-- the CLI server. However, you do need to provide
-- two (quotation-mark-enclosed) strings: The name
-- of the program, and the name of the language.
-- Unfortunately, because of the way the data is
-- stored, there's not really an easy way to get
-- the language name automatically.
makeCLI "{{name}}" "<Insert Language Name Here>"


