module Commands where

	-- Cambiar todas los parámetros por listas, así reducimos las llamadas y podemos usar la intensional
	import System.IO
	import qualified Socket
	import qualified Functions
	type ConnectedSocket = Handle 

	-- Login && Connect
	
	getUser :: ConnectedSocket -> [String] -> IO()
	getUser cS xs = do
			let sRequest = "USER " ++ (xs!!0) ++ " " ++ (xs!!1) ++ " " ++ (xs!!2) ++ " " ++ (xs!!3)
			Socket.sendContent sRequest cS
			return()
	
	getNick :: ConnectedSocket -> [String] -> IO()
	getNick cS xs = do
			let sRequest = "NICK " ++ (xs!!0)
			Socket.sendContent sRequest cS
			return()
	
	joinIrc :: ConnectedSocket -> [String] -> IO()
	joinIrc cS xs = do
			let sRequest = "JOIN " ++ (xs!!0)
			Socket.sendContent sRequest cS
			return()

	-- [NickName,UserName,ChannelIRC]
	execLogin :: [String] -> ConnectedSocket -> IO()
	execLogin xs cS = do
			nickGetted <- getNick cS [(xs!!0)]
			userGetted <- getUser cS [(xs!!0),"8","* :",(xs!!1)]
			ircGetted  <- joinIrc cS [(xs!!2)]
			sResponse <- Socket.getContent cS
			putStrLn sResponse
			return()

	
	-- User Functions
	
	setName :: [String] -> ConnectedSocket ->  IO()
	setName xs cS = do
			let sRequest = "SETNAME " ++ (xs!!0)
			Socket.sendContent sRequest cS
			return()
	
	quit :: [String] -> ConnectedSocket ->  IO()
	quit xs cS = do
			let sRequest = "QUIT " ++ (xs!!0)
			Socket.sendContent sRequest cS
			return()
	
	-- Ejemplo Gestión: 
	setPass :: [String] -> ConnectedSocket ->  IO()
	setPass xs cS = do
			let sRequest = "PASS " ++ (xs!!0)
			Socket.sendContent sRequest cS
			return()
	
	-- Message Functions
	
	--[MessageTarget,Message]
	privMsg :: [String] -> ConnectedSocket ->  IO()
	privMsg xs cS = do
			let sRequest = "PRIVMSG " ++ (xs!!1) ++ " " ++ (xs!!2)
			Socket.sendContent sRequest cS
			return()

	changeTopic :: [String] -> ConnectedSocket ->  IO()
	changeTopic xs cS = do
			let sRequest = "TOPIC " ++ (xs!!1) ++ " " ++ (xs!!2)
			Socket.sendContent sRequest cS
			return()
	
	-- Other Functions
	
	listAllUsers :: [String] -> ConnectedSocket ->  IO()
	listAllUsers xs cS = do
			let sRequest = "LIST"
			Socket.sendContent sRequest cS
			sResp <- Socket.getContent cS
			Socket.sendContent sResp cS
			return()
	
	--whoisUser :: NickName -> IrcCommand
	--whoisUser 
	
	--banUser :: NickName -> IrcCommand
	--banUser x = "/mode +b " ++ "show(Socket.send(getUserIp x))"
	
	--pingUsers :: [String] -> IrcCommand
	--pingUsers [] = ""
	--pingUsers (x:xs) = "PING " ++ (concatUsers (x:xs))
	
	--concatUsers :: [NickName] -> String
	--concatUsers [] = ""
	-- Se concatenarán todos los usuarios activos, se usará para hacer ping global
	--concatUsers (x:xs) = show(Socket.send(getUserIP x)) ++ (concatUsers xs)
	
--	getUserIP :: [NickName] -> ircCommand
--	getUserIP xs = "USERIP " ++ (xs!!1)
	-- Admin Functions
	
	--kickUser :: ChannelServ -> NickName -> IrcCommand
	--kickUser c n = "KICK " ++ c ++ " " ++ n
