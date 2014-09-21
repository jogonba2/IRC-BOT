module Functions where
	-- cabal install Crypto
	import Data.Time
	import Data.List
	--import Crypto.HASH
	import Socket
	-- Get Date
	--getTime :: IO UTCTime
	--getTime = do
	--		let c = getCurrentTime
			-- llamar a Socket con c para enviar datos desde aquí
	--		return()
	
	-- Get MD5
	--md5 returns a 4-tuple of 32bitWords, it is necessary convert it to String by meaning of concatTuplMD5 and after send it by socket to irc.freenode.net
	--getMD5 :: (MD5 a) => a -> IO String
	--getMD5 token = --Enviar (concatTuplMD5 (md5 token))
	
	--concatTuplMD5 :: ABCD -> String
	--concatTuplMD5 [] = ""
	--concatTuplMD5 (x:xs) = (show x) ++ (concatTuplMD5 xs)

	extractMessage :: String -> IO(String)
	extractMessage xs = do
			    return(xs++"holajaramigo")

	--splitMessage :: String -> String
	--splitMessage xs
	--		  | (xs!!0) == ":" = xs
	--		  | otherwise = (splitMessage xs)
			
	
	
	
	
	
