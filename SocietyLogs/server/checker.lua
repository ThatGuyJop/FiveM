if Autodealer.InkoopWH == nil and Autodealer.VerkoopWH == nil and Autodealer.KluisWH == nil and Autodealer.GeldWH == nil and Autodealer.StockWH == nil then
	local Content = LoadResourceFile(GetCurrentResourceName(), 'config.lua')
	Content = load(Content)
	Content()
end
-- Inkoop Error
if Autodealer.InkoopWH == "DISCORD_WEBHOOK" then
	print('\n\nERROR\n' .. GetCurrentResourceName() .. ': Je bent vergeten een Webhook te zetten\n\n')
else
	PerformHttpRequest(Autodealer.InkoopWH, function(Error, Content, Head)
		if Content == '{"code": 50027, "message": "Invalid Webhook Token"}' then
			print('\n\nERROR\n' .. GetCurrentResourceName() .. ': "Een webhook is invalid!\n\n')
		end
	end)
end

-- Verkoop Error
if Autodealer.VerkoopWH == "DISCORD_WEBHOOK" then
	print('\n\nERROR\n' .. GetCurrentResourceName() .. ': Je bent vergeten een Webhook te zetten\n\n')
else
	PerformHttpRequest(Autodealer.VerkoopWH, function(Error, Content, Head)
		if Content == '{"code": 50027, "message": "Invalid Webhook Token"}' then
			print('\n\nERROR\n' .. GetCurrentResourceName() .. ': "Een webhook is invalid!\n\n')
		end
	end)
end

-- Kluis Error
if Autodealer.KluisWH == "DISCORD_WEBHOOK" then
	print('\n\nERROR\n' .. GetCurrentResourceName() .. ': Je bent vergeten een Webhook te zetten\n\n')
else
	PerformHttpRequest(Autodealer.KluisWH, function(Error, Content, Head)
		if Content == '{"code": 50027, "message": "Invalid Webhook Token"}' then
			print('\n\nERROR\n' .. GetCurrentResourceName() .. ': "Een webhook is invalid!\n\n')
		end
	end)
end

-- Geld Error
if Autodealer.GeldWH == "DISCORD_WEBHOOK" then
	print('\n\nERROR\n' .. GetCurrentResourceName() .. ': Je bent vergeten een Webhook te zetten\n\n')
else
	PerformHttpRequest(Autodealer.GeldWH, function(Error, Content, Head)
		if Content == '{"code": 50027, "message": "Invalid Webhook Token"}' then
			print('\n\nERROR\n' .. GetCurrentResourceName() .. ': "Een webhook is invalid!\n\n')
		end
	end)
end

-- Stock Error
if Autodealer.StockWH == "DISCORD_WEBHOOK" then
	print('\n\nERROR\n' .. GetCurrentResourceName() .. ': Je bent vergeten een Webhook te zetten\n\n')
else
	PerformHttpRequest(Autodealer.StockWH, function(Error, Content, Head)
		if Content == '{"code": 50027, "message": "Invalid Webhook Token"}' then
			print('\n\nERROR\n' .. GetCurrentResourceName() .. ': "Een webhook is invalid!\n\n')
		end
	end)
end

-- Start
PerformHttpRequest(DiscordWebhookSystemInfos, function(Error, Content, Head) end, 'POST', json.encode({username = Autodealer.username, content = '**Script is gestart**'}), { ['Content-Type'] = 'application/json' })

local CurrentVersion = '0.0.8 (BETA)'
local ResourceName = 'SocietyLogs'

if (GetCurrentResourceName == ResourceName) 
    then
        return
    else
        print('\n')
        print('//////////////////////')
        print('//' .. GetCurrentResourceName())
        print('//////////////////////')
        print('\n')
        print('ERROR')
        print('ERROR')
        print('ERROR')
        print('\n')
        print('Sommige functies zullen nu of later niet werken')
        print('Als de resource naam niet gelijk is aan' .. ResourceName)
end

PerformHttpRequest('https://raw.githubusercontent.com/ThatGuyJop/Discord-Bots/main/AutoDealer/VOORFIVEM/.versie', function(Error, NewestVersion, Header)
	PerformHttpRequest('https://raw.githubusercontent.com/ThatGuyJop/Discord-Bots/main/AutoDealer/VOORFIVEM/changes', function(Error, Changes, Header)
		print('\n')
		print('##############')
		print('## ' .. GetCurrentResourceName())
		print('##')
		print('## Current Version: ' .. CurrentVersion)
		print('## Newest Version: ' .. NewestVersion)
		print('##')
		if CurrentVersion ~= NewestVersion then
			print('## Outdated')
			print('## Check the GitHub')
			print('## For the newest Version!')
			print('##############')
			print('CHANGES:\n' .. Changes)
		else
			print('## Up to date!')
			print('##############')
		end
		print('\n')
	end)
end)
 