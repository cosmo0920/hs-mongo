module App.Mongo
  ( run
  , dbName ) where

import Database.MongoDB
import Prelude
import App.Util
import App.Mongo.Internal

run :: Action IO ()
run = do
  clearUser
  insertUser
  allUser           >>= printDocs "All User"
  specificNameUser  >>= printDocs "test user1"
  specificNameUser2 >>= printDocs "test user2"
  notFoundUser      >>= printDocs "test user3"
