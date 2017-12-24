#!/usr/bin/env stack
{- stack
  script
  --nix
  --resolver lts-9.18
  --package directory
  --package filepath
  --package text
  --package protolude
  --package turtle
  --package shakespeare
  --compile
-}

{-# LANGUAGE ExtendedDefaultRules #-}
{-# LANGUAGE NoImplicitPrelude    #-}
{-# LANGUAGE OverloadedStrings    #-}
{-# LANGUAGE QuasiQuotes          #-}
{-# LANGUAGE ScopedTypeVariables  #-}

import           Control.Monad         (fail)
import           Protolude
import           System.Directory      (doesFileExist, listDirectory,
                                        makeAbsolute)
import           System.Environment    (getArgs)
import           System.FilePath       (dropExtensions, takeDirectory)
import           Text.Shakespeare.Text (st)
import qualified Data.Text as Text

render :: [Text] -> Text
render names = imports <> "\n\n" <> exports <> "\n"
  where
    importLine :: Text -> Text
    importLine name = [st|import #{name} from './#{name}'|]

    imports :: Text
    imports = fmapAndJoin importLine names

    exportLine :: Text -> Text
    exportLine name = [st|  #{name},|]

    exports :: Text
    exports = [st|export {
#{fmapAndJoin exportLine names}
}|]

    fmapAndJoin f xs = Text.intercalate "\n" $ f <$> xs

main :: IO ()
main = do
  (file:_) <- getArgs
  indexPath <- makeAbsolute file
  fileExists <- doesFileExist indexPath
  unless fileExists (fail $ "not a file " ++ indexPath)
  let indexDirPath = takeDirectory indexPath
  files <- listDirectory indexDirPath
  let filesWithoutExtension = fmap dropExtensions files
  let names = sort $ filter (/= "index") $ toS <$> filesWithoutExtension
  let newContent = render names
  -- putStr newContent
  writeFile indexPath newContent
