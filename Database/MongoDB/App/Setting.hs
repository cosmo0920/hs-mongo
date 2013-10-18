module Database.MongoDB.App.Setting
    ( mongoSettings
    , databaseSettings ) where

import Data.Aeson (decode, Value)
import Data.Maybe
import qualified Data.ByteString.Lazy as B
import Data.Text
import Control.Lens
import Data.Aeson.Lens
import Prelude

-- MongoDBの接続情報をjsonから取得する
mongoSettings :: IO (String, String)
mongoSettings = do
  fstr <- B.readFile "mongo.json"
  let v = decode fstr :: Maybe Value
  let hostVal = v ^. key (pack "mongo") ^. key (pack "host") :: Maybe String
      portVal = v ^. key (pack "mongo") ^. key (pack "port") :: Maybe String
  let _host = fromJust hostVal
      _port =  fromJust portVal
  return (_host,_port)

-- MongoDBのDB名とCollection名をjsonから取得する
databaseSettings :: IO (String, String)
databaseSettings = do
  fstr <- B.readFile "mongo.json"
  let v = decode fstr :: Maybe Value
  let dbNameVal     = v ^. key (pack "database") ^. key (pack "db") :: Maybe String
      collectionVal = v ^. key (pack "database") ^. key (pack "collection") :: Maybe String
  let _dbName     = fromJust dbNameVal
      _collection =  fromJust collectionVal
  return (_dbName,_collection)