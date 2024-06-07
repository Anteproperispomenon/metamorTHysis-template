module Server
  ( ConvertMessage(..)
  , QueryMessage(..)
  , processInput
  , serveQueries
  , runServer
  ) where

import Orthographies
import Metamorth.Server.Types.Embedded

import Metamorth.Server.Processing
import Metamorth.Server.API

-- Again, these functions auto-generate most of the
-- necessary code by themselves. If you get a compile
-- error saying something about "inputOrthNameMap" or
-- "outputOrthNameMap" not being defined/found, make
-- sure they're in the export list in "Orthographies.hs".
--
-- These types are then used by "makeCLI" in server/Main.hs.
makeJSONTypes inputOrthNameMap outputOrthNameMap

makeProcessFunc
makeServantTypes

-- Now, these functions generate JavaScript and HTML
-- that can be reached from something like
-- "localhost:8081/interactive/convert.html".
generateJS @ConvertAPI
makeMainHTML inputOrthNameMap outputOrthNameMap

