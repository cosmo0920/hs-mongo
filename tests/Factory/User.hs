module Factory.User
    ( withDB
    , withUsers
    , withUsersNotFound
    , dbName
    , collectionName ) where

import Control.Monad.Trans
import Control.Exception(bracket_)
import Database.MongoDB
import Settings
import Prelude
-- DB
withDB :: MonadIO m => Database -> Action m a -> m (Either Failure a)
withDB name action = do
  (host', _port') <- liftIO mongoSettings
  pipe <- liftIO $ runIOE $ connect (host host')
  access pipe master name action

dbName :: Database
dbName = "test"

collectionName :: Collection
collectionName = "user"

-- setup/teardown
withUsers :: IO a -> IO a
withUsers = bracket_ setup teardown
  where
    setup = withDB dbName $ insertMany collectionName [
      [ "user_id" =: "1", "name" =: "test user1"],
      [ "user_id" =: "2", "name" =: "test user2"]]
    teardown = withDB dbName $ delete (select [] $ collectionName)

-- setup/teardown
withUsersNotFound :: IO a -> IO a
withUsersNotFound = bracket_ setup teardown
  where
    setup = withDB dbName $ insertMany collectionName [
      [ "user_id" =: "1", "name" =: "test user"],
      [ "user_id" =: "2", "name" =: "some user"]]
    teardown = withDB dbName $ delete (select [] $ collectionName)