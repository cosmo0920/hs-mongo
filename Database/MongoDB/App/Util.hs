module Database.MongoDB.App.Util
  ( dbName
  , collectionName
  , printDocs ) where
import Database.MongoDB
import Control.Monad.Trans (liftIO)
import Prelude

dbName :: Database
dbName = "dbuser"

collectionName :: Collection
collectionName = "user"

printDocs :: String -> [Document] -> Action IO ()
printDocs title docs = liftIO $ putStrLn title >> mapM_ (print . exclude ["_id"]) docs
