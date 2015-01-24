{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}

import System.Environment
import Yesod

data Hello = Hello

mkYesod "Hello" [parseRoutes|/ HomeR GET|]

instance Yesod Hello

getHomeR :: Handler String
getHomeR = return "Hello, world!"

main :: IO ()
main = do
    env <- getEnvironment
    let port = maybe 8080 read $ lookup "PORT" env
    warp port Hello
