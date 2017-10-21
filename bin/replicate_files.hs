-- {-# LANGUAGE NoImplicitPrelude   #-}
{-# LANGUAGE ScopedTypeVariables #-}

-- import           Debug.Trace
-- import           Protolude
import           System.Directory
import           System.FilePath

addIndex :: [b] -> [(Integer, b)]
addIndex = zip [0 ..]

times :: Integer
times = 4

main :: IO ()
main = do
  cwd <- getCurrentDirectory
  files <- listDirectory cwd
  let whatWhereList = do
        path <- files
        i <- [0 .. times]
        let base = takeBaseName path
        let newbase = base ++ show i
        let newpath = replaceBaseName path newbase
        return (path, newpath)
  mapM_ (uncurry copyFile) whatWhereList
--
-- main :: IO ()
-- main = do
--   cwd <- getCurrentDirectory
--   files <- listDirectory cwd
--   let whatWhereList :: [(FilePath, FilePath)] = do
--         path <- files
--         i <- [0 .. times]
--         let base = takeBaseName path
--         let newbase = base ++ show i
--         let newpath = replaceBaseName path newbase
--         return (path, newpath)
--   mapM_ (uncurry copyFile) whatWhereList
