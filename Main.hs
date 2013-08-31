import App.Mongo
import App.Setting
import Database.MongoDB
import Prelude

main :: IO ()
main = do
  (host', _port') <- mongoSettings
  pipe <- runIOE $ connect (host host')
  e <- access pipe master dbName run
  close pipe
  print e
