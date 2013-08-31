module App.Mongo
  ( run
  , dbName ) where

import Database.MongoDB
import Prelude
import App.Util

run :: Action IO ()
run = do
  clearUser
  insertUser
  allUser >>= printDocs "All User"
  specificNameUser >>= printDocs "test user1"
  specificNameUser2 >>= printDocs "test user2"
  notFoundUser >>= printDocs "test user3"

clearUser :: Action IO ()
clearUser = delete (select [] collectionName)

insertUser :: Action IO [Value]
insertUser = insertMany collectionName [
  [ "name" =: "test user1"
  , "email" =: ["mail1" =: "test@example.com", "mail2" =: "test@test.jp"]],
  [ "name" =: "test user2"
  , "email" =: ["mail1" =: "example@test.com", "mail2" =: "example@test.net"]]]

allUser :: Action IO [Document]
allUser = rest =<< find (select [] collectionName) {sort = ["name.email1.mail1" =: 1]}

specificNameUser :: Action IO [Document]
specificNameUser = rest =<< find (select ["name" =: "test user1"] collectionName)

specificNameUser2 :: Action IO [Document]
specificNameUser2 = rest =<< find (select ["name" =: "test user2"] collectionName)
                                  {project = ["name" =: 1, "email.mail1" =: 1]}

notFoundUser :: Action IO [Document]
notFoundUser = rest =<< find (select ["name" =: "test user3"] collectionName)
