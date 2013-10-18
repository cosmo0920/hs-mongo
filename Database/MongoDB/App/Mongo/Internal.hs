module Database.MongoDB.App.Mongo.Internal
  ( clearUser
  , insertUser
  , allUser
  , specificNameUser
  , specificNameUser2
  , notFoundUser ) where

import Database.MongoDB
import Prelude
import Database.MongoDB.App.Util

-- DELETE
clearUser :: Action IO ()
clearUser = delete (select [] collectionName)

-- CREATE
insertUser :: Action IO [Value]
insertUser = insertMany collectionName [
  [ "name" =: "test user1"
  , "email" =: ["mail1" =: "test@example.com", "mail2" =: "test@test.jp"]],
  [ "name" =: "test user2"
  , "email" =: ["mail1" =: "example@test.com", "mail2" =: "example@test.net"]]]

-- READ
allUser :: Action IO [Document]
allUser = rest =<< find (select [] collectionName) {sort = ["name.email1.mail1" =: 1]}

specificNameUser :: Action IO [Document]
specificNameUser = rest =<< find (select ["name" =: "test user1"] collectionName)

specificNameUser2 :: Action IO [Document]
specificNameUser2 = rest =<< find (select ["name" =: "test user2"] collectionName)
                                  {project = ["name" =: 1, "email.mail1" =: 1]}

notFoundUser :: Action IO [Document]
notFoundUser = rest =<< find (select ["name" =: "test user3"] collectionName)

-- UPDATE
-- Now, Nothing implement.