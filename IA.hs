-- Árbol de decisiones, tantas ramas como estados de humor se quieran poner,de más a intenso a menos conforme se desciende en la jerarquía.
module IA(getResponse,IATree,Response,Humour,HumourInt,Message) where
	import qualified Commands
	--import qualified Socket
	type HumourInt = Int
	data Humour = Cheerful HumourInt | Disappointed HumourInt | Angry HumourInt | Depressed HumourInt deriving (Eq,Ord)
	type Response = String
	data IATree a = Leaf [Response] | Branch [IATree a] deriving (Eq,Ord,Show)
	type LastPhrase = String
	type Patterns = String
	type Params = String
	type Message = String
	
	-- La IA será para gestionar los comandos, sacará mensajes dependiendo del estado de ánimo.
	getResponse :: Humour -> (IATree a) -> Response
	getResponse (Cheerful x) (Branch(p:ps))= walkBranch 0 x (Branch (p:ps))
	getResponse (Disappointed x) (Branch (p:ps)) = walkBranch 1 x (Branch (p:ps))
	getResponse (Angry x) (Branch (p:ps)) = walkBranch 2 x (Branch (p:ps))
	getResponse (Depressed x) (Branch (p:ps)) = walkBranch 3 x (Branch (p:ps))
	
	-- x nº of branch, y nº of intensity
	walkBranch :: Int -> HumourInt -> (IATree a) -> Response
	walkBranch 0 y (Branch (p:ps)) = walkLeafs y p
	walkBranch x y (Branch (p:ps)) = walkBranch (x-1) y (Branch ps)
	
	walkLeafs :: Int -> (IATree a) -> Response
	walkLeafs 0 (Leaf (x:xs)) = x
	walkLeafs y (Leaf (x:xs)) = walkLeafs (y-1) (Leaf xs)
	
	-- [] Lista con funciones, [!] lista de patrones, hacer zip cada lista y acceder a la funcion cuya posicion sea el patrón de lo último escrito
	
	-- zip [putMessage,kickUser,...,setName] ["!say","!kick",...,"!setName"]
	-- Se hará Socket.sendFunction (funct ps)
	-- Cambiar parámetros de commands por listas
	--carryOutCommand :: LastPhrase -> [Message->Response] -> [Patterns] -> [Params] -> [Response]
	--carryOutCommand t (x:xs) (y:ys) ps = [ funct ps| (funct,pattern) <- (zip (x:xs) (y:ys)) , t==snd (funct,pattern)]
					 
