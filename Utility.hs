module Utility
where

lc_first :: String -> String
lc_first str@(s:ss) = if any (flip isPrefixOf str) [
	"Mnookin"
	 ]
	then s:ss
	else toLower s:ss
