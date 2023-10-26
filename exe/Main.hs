module Main where

import Data.Aeson (Value)
import Data.Aeson.Encode.Pretty qualified as Json
import Data.ByteString qualified as BS
import Data.ByteString.Lazy.Char8 qualified as LBS
import Jose.Jwt qualified as Jwt

-- read JWT from stdio, and pretty-print its claims
main :: IO ()
main = do
  jwt <- BS.getContents
  case Jwt.decodeClaims @Value jwt of
    Right (_header, claims) -> do
      LBS.putStrLn mempty
      LBS.putStrLn (Json.encodePretty claims)
    Left e -> fail (show e)
