import Control.Monad

main = forM_ list $ \n -> do
    print $ show n

list = filter condition xs
    where
        condition = (< 0.5) . snd
        xs = map (p 10000) [1..]

p h n = (n, y)
    where
        a = -n * (n - 1)
        b = 2 + h
        y = 1 - exp (a / b)

