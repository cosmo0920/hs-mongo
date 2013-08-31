module Spec
  ( specs ) where

import Factory.User
import Test.Hspec
import Prelude
import Test.HUnit (assertBool, assertFailure)
import Database.MongoDB

includeUser :: [Document] -> Bool
includeUser = any isExistUser
  where
    isExistUser doc = (at $ "name") doc == "test user1"

specs :: Spec
specs = describe "mongodb setup/teardown" $ do
  it "should be included specific User" $ withUsers $ do
    documents <- withDB dbName $
      rest =<< Database.MongoDB.find (select [] collectionName)
    case documents of
      Right docs -> assertBool "OK" $ includeUser docs
      Left _     -> assertFailure "DB access failed"

  it "should be not included specific User" $ withUsersNotFound $ do
    documents <- withDB dbName $
      rest =<< Database.MongoDB.find (select [] collectionName)
    case documents of
      Right docs -> assertBool "OK" $ not $ includeUser docs
      Left _     -> assertFailure "DB access failed"
