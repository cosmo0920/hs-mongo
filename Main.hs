import HSMongo
import Database.MongoDB hiding (Value)
import Data.Aeson (decode, Value)
import Data.Maybe
import qualified Data.ByteString.Lazy as B
import Data.Text
import Control.Lens
import Data.Aeson.Lens
import Prelude

main :: IO ()
main = do
  (host', _port') <- mongoSettings
  pipe <- runIOE $ connect (host host')
  e <- access pipe master dbName run
  close pipe
  print e

mongoSettings :: IO (String, String)
mongoSettings = do
  fstr <- B.readFile "mongo.json"
  let v = decode fstr :: Maybe Value
  let hostVal = v ^. key (pack "host") :: Maybe String
      portVal = v ^. key (pack "port") :: Maybe String
  let _host = fromJust hostVal
      _port =  fromJust portVal
  return (_host,_port)
