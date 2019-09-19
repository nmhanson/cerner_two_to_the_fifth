-- cerner_2^5_2019

-- compile with GHC
-- run main to get the docstring :)
import Data.List

getTruncatedLn :: Int -> [String] -> (String, [String])
getTruncatedLn width (x:xs) = getTruncatedLn' width x xs

getTruncatedLn' :: Int -> String -> [String] -> (String, [String])
getTruncatedLn' _ curr [] = (curr, [])
getTruncatedLn' width curr rem =
    if length next <= width then getTruncatedLn' width next (tail rem)
                            else (curr, rem)
                            where next = curr ++ " " ++ head rem

wrap :: Int -> String -> String
wrap width = intercalate "\n" . wrap' width . words

wrap' :: Int-> [String] -> [String]
wrap' _ [] = []
wrap' width rem =
    case getTruncatedLn width rem of (ln, []) -> [ln]
                                     (ln, more) -> ln : wrap' width more

main :: IO ()
main = putStrLn $ wrap 80 "This is a long line to test the wrapping capabilities of my entry for cerner two to the fifth competition. It is written in haskell, and I think it's pretty cool. The wrap function takes a integer width and a line of text which may be too long to display in that width, and breaks the lines down into chunks of size width or smaller, without splitting up words in the middle. This definitely embodies the spirit of engineer productivity more than any other entry. Thank you in advance for awarding me the win."
