module Database.MongoDB.App.Mongo
  ( run
  , dbName ) where

import Database.MongoDB
import Prelude
import Database.MongoDB.App.Util
import Database.MongoDB.App.Mongo.Internal

run :: Action IO ()
run = do
  clearUser
  insertUser
  allUser           >>= printDocs "All User"
  specificNameUser  >>= printDocs "test user1"
  specificNameUser2 >>= printDocs "test user2"
  notFoundUser      >>= printDocs "test user3"
