module Socket(sendContent,connectSocket,getContent,ConnectedSocket) where

	import System.IO
	import Network
	import Network.BSD
	type ServerName = String
	type Port = Int
	type ChannelServ = String
	type Nick = String
	type ConnectedSocket = Handle

	-- Connect
	connectSocket :: ServerName -> Port -> IO(ConnectedSocket)
	connectSocket sN pR = do
				b <- connectTo sN (PortNumber 6667)
				return (b)
				
	-- Send Content
	sendContent :: String -> ConnectedSocket -> IO()
	sendContent sT cS = do
		hPutStrLn cS sT
		hFlush cS
		return()
		
	-- Recv data
	getContent :: ConnectedSocket -> IO(String)
	getContent cS = do
		sResponse <- hGetContents cS 
		return(sResponse)
