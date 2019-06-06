import Control.Monad
import Text.Printf

data KeyValue = KeyValue { lineNo Double
                               , value  Double
                               }

main :: IO ()
main = do
    let list = filter condition $ map (prob 1000) [1..]
    forM_ list printKeyValue

printKeyValue :: KeyValue -> IO ()
printKeyValue (KeyValue k v) = do
    printf "%4.0f: %0.2f\n" k v

condition :: KeyValue -> Bool
condition (KeyValue _ y) = y < 0.5

prob :: Double -> Double -> KeyValue
prob h n = KeyValue n y
    where
        a = -n * (n - 1)
        b = 2 + h
        y = 1 - exp (a / b)

