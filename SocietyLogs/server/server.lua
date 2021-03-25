--[[

KOMT IN EEN UPDATE

]]
-- ERROR CHECK
-- local AutoDealer.

-- if DiscordWebhookSystemInfos == nil and DiscordWebhookKillinglogs == nil and DiscordWebhookChat == nil then
-- 	local Content = LoadResourceFile(GetCurrentResourceName(), 'config.lua')
-- 	Content = load(Content)
-- 	Content()
-- end
-- if DiscordWebhookSystemInfos == 'WEBHOOK_LINK_HERE' then
-- 	print('\n\nERROR\n' .. GetCurrentResourceName() .. ': Please add your "System Infos" webhook\n\n')
-- else
-- 	PerformHttpRequest(DiscordWebhookSystemInfos, function(Error, Content, Head)
-- 		if Content == '{"code": 50027, "message": "Invalid Webhook Token"}' then
-- 			print('\n\nERROR\n' .. GetCurrentResourceName() .. ': "System Infos" webhook non-existent!\n\n')
-- 		end
-- 	end)
-- end
-- if DiscordWebhookKillinglogs == 'WEBHOOK_LINK_HERE' then
-- 	print('\n\nERROR\n' .. GetCurrentResourceName() .. ': Please add your "Killing Log" webhook\n\n')
-- else
-- 	PerformHttpRequest(DiscordWebhookKillinglogs, function(Error, Content, Head)
-- 		if Content == '{"code": 50027, "message": "Invalid Webhook Token"}' then
-- 			print('\n\nERROR\n' .. GetCurrentResourceName() .. ': "Killing Log" webhook non-existent!\n\n')
-- 		end
-- 	end)
-- end
-- if DiscordWebhookChat == 'WEBHOOK_LINK_HERE' then
-- 	print('\n\nERROR\n' .. GetCurrentResourceName() .. ': Please add your "Chat" webhook\n\n')
-- else
-- 	PerformHttpRequest(DiscordWebhookChat, function(Error, Content, Head)
-- 		if Content == '{"code": 50027, "message": "Invalid Webhook Token"}' then
-- 			print('\n\nERROR\n' .. GetCurrentResourceName() .. ': "Chat" webhook non-existent!\n\n')
-- 		end
-- 	end)
-- end
	
-- -- System Infos
-- PerformHttpRequest(DiscordWebhookSystemInfos, function(Error, Content, Head) end, 'POST', json.encode({username = SystemName, content = '**FiveM server webhook started**'}), { ['Content-Type'] = 'application/json' })
 

if string.find(Autodealer.WHCFG.Color,"#") then
	local GColor = tonumber(AutoDealer.WHCFG.Color:gsub("#",""),16)
else
	local GColor = Autodealer.WHCFG.Color
end


exports('discord', function(message, id, id2, color, channel)
	-- checking if export is used correctly
	local _message = message
	
	if message == nil then print("^1Error: JD_Logs Export. Invalid message.^0") return end
	if id == nil or id == "PLAYER_ID" or not tonumber(id) then print("^1Error: JD_Logs Export. Invalid player id.^0") return end
	if id == nil or id2 == "PLAYER_2_ID" or not tonumber(id2) then print("^1Error: JD_Logs Export. Invalid second player id.^0") return end
	if color == nil then print("^1Error: JD_Logs Export. Invalid color.^0") return end
	if channel == nil or channel == "" then print("^1Error: JD_Logs Export. Invalid channel.^0") return end

	-- Check if hex or decimal color is used
	if string.find(color,"#") then _color = tonumber(color:gsub("#",""),16) else _color = color end

	if id2 ~= 0 then
		local player1 = GetPlayerDetails(id)
		local player2 = GetPlayerDetails(id2)
		_message = message..'\n'..player1..'\n'..player2
	else
		if id == 0 then
			_message = message
		else
			local player1 = GetPlayerDetails(id)
			_message = message..'\n'..player1
		end
	end
   discordLog(_message, _color,  channel)
end)


function discordLog(message, color, channel)
      PerformHttpRequest(AutoDealer.Logs[channel], function(err, text, headers) end, 'POST', json.encode({username = AutoDealer.username, embeds = {{["color"] = color, ["author"] = {["name"] = AutoDealer.communtiyName,["icon_url"] = AutoDealer.communtiyLogo}, ["description"] = "".. message .."",["footer"] = {["text"] = "© JokeDevil.com - "..os.date("%x %X %p"),["icon_url"] = "https://www.jokedevil.com/img/logo.png",},}}, avatar_url = AutoDealer.avatar}), { ['Content-Type'] = 'application/json' })
end

RegisterServerEvent('DiscordBot:ToDiscord')
AddEventHandler('DiscordBot:ToDiscord', function(WebHook, Name, Message, Image, Source, TTS, FromChatResource)
	if WebHook:lower() == 'chat' then
		WebHook = DiscordWebhookChat
	elseif WebHook:lower() == 'system' then
		WebHook = DiscordWebhookSystemInfos
	elseif WebHook:lower() == 'kill' then
		WebHook = DiscordWebhookKillinglogs
	elseif not WebHook:find('discordapp.com/api/webhooks') then
		print('Please specify a webhook link!')
		return nil
	end

	PerformHttpRequest(WebHook, function(Error, Content, Head) end, 'POST', json.encode({username = Name, content = Message, avatar_url = Image, tts = TTS}), {['Content-Type'] = 'application/json'})
end)


RegisterServerEvent('ClientDiscord')
AddEventHandler('ClientDiscord', function(message, id, id2, color, channel)
	local _message = message
	
	if message == nil then print("^1Error: JD_Logs Export. Invalid message.^0") return end
	if id == nil or id == "PLAYER_ID" or not tonumber(id) then print("^1Error: JD_Logs Export. Invalid player id.^0") return end
	if id == nil or id2 == "PLAYER_2_ID" or not tonumber(id2) then print("^1Error: JD_Logs Export. Invalid second player id.^0") return end
	if color == nil then print("^1Error: JD_Logs Export. Invalid color.^0") return end
	if channel == nil or channel == "" then print("^1Error: JD_Logs Export. Invalid channel.^0") return end

	-- Check if hex or decimal color is used
	if string.find(color,"#") then _color = tonumber(color:gsub("#",""),16) else _color = color end

	if id2 ~= 0 then
		local player1 = GetPlayerDetails(id)
		local player2 = GetPlayerDetails(id2)
		_message = message..'\n'..player1..'\n'..player2
	else
		if id == 0 then
			_message = message
		else
			local player1 = GetPlayerDetails(id)
			_message = message..'\n'..player1
		end
	end
   discordLog(_message, _color,  channel)
end)

-- Send message when a resource is being stopped
AddEventHandler('onResourceStop', function (resourceName)
    discordLog('**' .. resourceName .. '** has been stopped.', resourceColor, 'resources')
end)

-- Send message when a resource is being started
AddEventHandler('onResourceStart', function (resourceName)
    Wait(100)
    discordLog('**' .. resourceName .. '** has been started.', resourceColor, 'resources')
end)

function GetPlayerDetails(src)
	local player_id = src
	local ids = ExtractIdentifiers(player_id)
	if AutoDealer.discordID then if ids.discord ~= "" then _discordID ="\n**Discord ID:** <@" ..ids.discord:gsub("discord:", "")..">" else _discordID = "\n**Discord ID:** N/A" end else _discordID = "" end
	if AutoDealer.steamID then if ids.steam ~= "" then _steamID ="\n**Steam ID:** " ..ids.steam.."" else _steamID = "\n**Steam ID:** N/A" end else _steamID = "" end
	if AutoDealer.steamURL then  if ids.steam ~= "" then _steamURL ="\nhttps://steamcommunity.com/profiles/" ..tonumber(ids.steam:gsub("steam:", ""),16).."" else _steamURL = "\n**Steam URL:** N/A" end else _steamURL = "" end
	return _discordID..''.._steamID..''.._steamURL
end

function ExtractIdentifiers(src)
    local identifiers = {
        steam = "",
        discord = "",
    }

    for i = 0, GetNumPlayerIdentifiers(src) - 1 do
        local id = GetPlayerIdentifier(src, i)

        if string.find(id, "steam") then
            identifiers.steam = id
        elseif string.find(id, "ip") then
            identifiers.ip = id
        elseif string.find(id, "discord") then
            identifiers.discord = id
        elseif string.find(id, "license") then
            identifiers.license = id
        elseif string.find(id, "xbl") then
            identifiers.xbl = id
        elseif string.find(id, "live") then
            identifiers.live = id
        end
    end

    return identifiers
end