module Situations where
	
	import IA
	import Data.Char
	--type Response = String
	--type HumourInt = Int
	--data Humour = Cheerful HumourInt | Disappointed HumourInt | Angry HumourInt | Depressed HumourInt deriving (Eq,Ord)
	--data IATree a = Leaf [Response] | Branch [IATree a] deriving (Eq,Ord,Show)
	
	-- Bad Situations
	aUpper :: Response -> Bool
	aUpper rS 
			| rS == (stringUpper rS) = True
			| otherwise = False
			
	
	-- Neutral Situations
	isHello :: Response -> Bool
	isHello rS
			| stringLower xs == "!hola" = True
			| stringLower xs == "!buenas" = True
			| stringLower xs == "!hey" = True
			| stringLower xs == "!bi" = True
	
	isBy :: Response -> bool
	isBy rS
			| stringLower xs == "!bye" = True
			| stringLower xs == "!adios" = True
			
	-- Manager (DEMO)
	mainSituations :: Response -> Response
	mainSituations rS = if (aUpper rS) then getResponse (IA.getAngry 2) (IA.getTree) else getResponse (IA.getCheerful 1) (IA.getTree)
			
	-- getResponse (IA.getAngry 2) (IA.getTree)
	stringUpper :: Response -> Response
	stringUpper xs = [(toUpper x) | x <- xs]
	
	stringLower :: Response -> Response
	stringLower xs = [(toLower x) | x <- xs]
	
	
	