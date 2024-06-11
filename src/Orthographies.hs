{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE QuasiQuotes #-}

{-|
Module      : Orthographies
Description : Main code for {{name}}
Copyright   : (c) {{author}}, {{year}}
License     : BSD-3

All of the functions and types in this module
are automatically generated from other files.

-}

module Orthographies
  -- * The Internal Type
  ( Phoneme(..)
  -- * The conversion functions
  , convertOrthography
  , convertOrthographyLazy
  , convertOrthographyBS
  -- * The types that select an orthography
  , InOrth(..)
  , OutOrth(..)
  -- * Details about the orthographies
  , inputOrthNameMap
  , outputOrthNameMap
  , languageDetails
  ) where

import Metamorth.Interaction.Quasi (metamorth)

-- This is where you declare most of the information
-- about your language and its orthographies. Note that
-- it has to start with "[metamorth|" and end with "|]".
[metamorth|

-- The name of the language you're working with.
-- This will be used when you're running the program.
-- Note that this value is optional.
language : MyLanguage 

-- The filepath of the phoneme data. To find out more
-- about how to write them, look in the example file.
phonemes : orth/phonemes.thym

-- Now, declaring an orthography. You must start by
-- giving a name for the orthography. This is the name
-- the program will use to refer to it as. 
Orth1

-- You then continue by listing all the details about
-- this orthography by starting a line indented at least
-- one space, of the form "option : value". Note that all
-- lines about the orthography must be indented the same
-- amount, except for empty lines and lines that only
-- contain comments.

  -- This is the path of the input specification. If the file path
  -- has spaces in it, you'll have to enclose it in
  -- (double) quotation marks. Otherwise, you can leave the
  -- the quotation marks off.
  input : "orth/orth1.thyp"

  -- Same for the output specification. Note that not all orthographies
  -- need to have both an input spec and an output spec, but
  -- you'll need at least one orthography with an input spec
  -- and one orthography with an output spec. Otherwise, there'd
  -- be no covertible option.
  output : "orth/orth1.thyo"

  -- This is a simple description of the orthography. Note that
  -- it must all be on one line here, but if you use the string
  -- "\n" at any point in the description, it will be converted
  -- to a linebreak in the program.
  description : "This is a very simple orthography.\nIt is primarily used in _____"
  
  -- This is the default extension value used by the program when
  -- converting files. If the user specifies an input file but no
  -- output file, this value will be inserted between the filename
  -- and its extension. 
  -- Note that even if you don't include a dot here, one will 
  -- automatically be added anyway.
  extension : ".or1"

  -- Next, the values the user can type in the CLI to get this orthography.
  -- Usually, this will include the name of the orthography itself,
  -- along with other, shorter ways to refer to the orthography.
  -- Be careful: Make sure this doesn't overlap with any other
  -- options for other orthographies; if they do, you won't be able
  -- to predict which orthography it will refer to.
  -- Note that all the names here are case-insensitive, so both you
  -- and the user are free to use any mixture of cases.
  cli-names : "orth1", "o1", "ort1", "orthography1", "orth-1", "orthography-1"

-- The next three options change how the code is created. Most of these
-- are on by default, since they can reduce the amount of code generated,
-- but sometimes they can cause issues (especially unify-branches). To turn
-- them on/off, you can use a variety of options. "Yes", "True", "t", "y", and
-- "on" all enable the options, while "FALSE", "no", "off", and "f" all disable
-- the options. Since all three options are on by default, you'll usually only
-- be using the "off" options. Again, the options are case-insensitive.
  unify-branches : off
  group-guards : ON
  check-states : Yes

-- Finally, we have some more internal options. These can be useful when
-- debugging, since you'll have a better idea of what went wrong with your
-- code.

  -- First, we have the suffix. This program generates a lot of internal
  -- functions for each orthography, and the suffix provides a way for the
  -- compiler to tell functions from each orthography apart. You don't technically
  -- have to specify this, as the compiler will just generate a generic "_prs001"
  -- suffix for each orthography, but it can be more useful for debugging to 
  -- give the compiler a specific suffix for each orthography. That way, you
  -- can tell which orthography is giving you problems. 
  -- Usually, you start the suffix off with an underscore.
  suffix : "_ort1"

  -- Next, we have the names of the the parser function and the output function.
  -- You can specify these directly if you want to make these functions available
  -- to export, but usually you just wouldn't specify these options.
  parser-name : orthParser1
  output-name : orthOutput1

-- And that's it (for the first orthography). You can then
-- specify the next orthography by writing an unindented name.

Orth2
  input  : "orth/orth2.thyp"
  output : "orth/orth2.thyo"
  description : "Another simple orthography."
  extension : ".or2"
  cli-names : "or2", "o2", "ort2", "orthography2", "orth-2", "orthography-2"
  suffix : "_ort2"
  parser-name : orthParser2
  output-name : orthOutput2

-- And finally, the closing bracket.

|]
