module Factory.User
    ( withDB
    , withUsers ) where

import Control.Monad.Trans
import Control.Exception(bracket_)
import Database.MongoDB
import Prelude
-- DB
withDB :: MonadIO m => Database -> Action m a -> m (Either Failure a)
withDB name action = do
  pipe <- liftIO $ runIOE $ connect (host "192.168.11.8")
  access pipe master name action

dbName :: Database
dbName = "test"

collectionName :: Collection
collectionName = "users"

-- setup/teardown
withUsers :: IO a -> IO a
withUsers = bracket_ setup teardown
  where
    setup =  withDB dbName $ insertMany collectionName
             [[ "user_id" =: "1", "name" =: "Abbey Lee Kershaw"],
              [ "user_id" =: "2", "name" =: "Miyamoto Rie"]]
    teardown = withDB dbName $ delete (select [] $ collectionName)