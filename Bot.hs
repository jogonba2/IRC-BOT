module Bot where
	--import qualified Socket
	import System.IO
	import qualified IA
	import qualified Commands
	import qualified Socket
	import qualified Functions
	type UserName = String
	type UserPass = String
	type ConnectedSocket = Handle
	
	main :: IO()
	main = do
		usN <- getLine
		usP <- getLine 
		let goodLogin = loginUser usN usP
		-- En vez de mostrar por pantalla loopBot, desplazarlo como main principal
		if goodLogin == False then (putStrLn badLogin) else loginBot
		return()
	
	loginBot :: IO()
	loginBot = do
		ircSocket <- Socket.connectSocket "irc.freenode.net" 6667
		login <- Commands.execLogin ["overxfl0w13333554434","overxfl0w13333554434","#sanko"] ircSocket
		--loop <- loopBot ircSocket
		return()
	
	loopBot :: ConnectedSocket -> IO()
	loopBot	cS = do
		textReceived <- Socket.getContent cS
		--textSended <- Socket.sendContent "Ah muere" cS
		--let textRecv = Functions.extractMessage(textReceived)
		--putStrLn textRecv
		(loopBot cS)
		return()

	--loopBot :: esperando leer del socket,
	--			una vez lea del socket que haga la función
	--			gestionar funciones e ir añadiendo...
	
	
	badLogin :: String
	badLogin = "Fail credentials"
	
	loginUser :: UserName -> UserPass -> Bool
	loginUser usN usP 
				| usN == "overxfl0w13" && usP == "mipass123" = True
				| otherwise = False
