import Factory.User
import Test.Hspec
import Prelude

main :: IO ()
main = hspec specs

specs ::Spec
specs = it "" $ do
  pending