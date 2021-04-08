author 'Jop#5813'
description 'Society Logs'
version '0.0.8'

-- Config
server_script 'config.lua'
server_script 'server/main.lua'
server_script 'server/checker.lua'
exports {
	'Inkoop',
	'Verkoop',
	'Stock',
	'Kluis',
	'Geld',
}

game 'gta5'
fx_version 'cerulean'