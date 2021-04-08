--Event to actually send Messages to Discord
RegisterServerEvent('SCLOG:Webhook')
AddEventHandler('SCLOG:Webhook', function(WebHook, Auto, Categorie, Prijs)
	if Message == nil or Message == '' then
		return nil
	end
    -- local Categorie = nil
    -- local Auto = nil
    -- local Desc = nil
    -- local Name = nil
 
	if WebHook:lower() == 'inkoop' then
		WebHook = Autodealer.InkoopWH
        Name = Inkoop Log
        Desc = "Hierbij informatie over een recent `ingekochte auto`."
        Fields = {
            { 
                name: "**Informatie**", 
                value: "**Prijs** : `".. Prijs .. "`\n**Wat** : `".. Categorie .."`\n**Voertuig** : `".. Auto .."`",
                inline: false 
            },
        }
	elseif WebHook:lower() == 'verkoop' then
		WebHook = Autodealer.VerkoopWH
        Name = Verkoop Log
        Desc = "Hierbij informatie over een recent `verkochte auto`."
        Fields = {
            { 
                name: "**Informatie**", 
                value: "**Prijs** : `".. Prijs .. "`\n**Wat** : `".. Categorie .."`\n**Voertuig** : `".. Auto .."`",
                inline: false 
            },
        }
	-- elseif WebHook:lower() == 'geld' then
	-- 	WebHook = Autodealer.GeldWH
    --     Name = Geld Log
    --     Desc = "Hierbij informatie over een recente activiteiten ivm `geld`."
    --     Fields = {
    --         { 
    --             name: "**Informatie**", 
    --             value: "**Prijs** : `".. Prijs .. "`\n**Wat** : `".. Categorie .."`\n**Voertuig** : `".. Auto .."`",
    --             inline: false 
    --         },
    --     }
    -- elseif WebHook:lower() == 'kluis' then
	-- 	WebHook = Autodealer.KluisWH
    --     Name = Kluis Log
    --     Desc = "Hierbij informatie over een recente activiteiten met de `kluis`."
    --     Fields = {
    --         { 
    --             name: "**Informatie**", 
    --             value: "**Wat** : `".. item .. "`\n**Wat** : `".. Categorie .."`\n**Voertuig** : `".. Auto .."`",
    --             inline: false 
    --         },
    --     }
    elseif WebHook:lower() == 'stock' then
		WebHook = Autodealer.StockWH
        Name = Stock Log
        Desc = "Hierbij informatie over een recente verandering in `stock`."
        Fields = {
            { 
                name: "**Informatie**", 
                value: "**Wat** : `".. item .. "`\n**Wat** : `".. Categorie .."`\n**Voertuig** : `".. Auto .."`",
                inline: false 
            },
        }
	elseif not WebHook:find('discordapp.com/api/webhooks') then
		print('Please specify a webhook link!')
		return nil
	end
    local date = os.date('*t')
    local timestamp = "%m %B %Y"
    local embed = {
        {
            ["color"] = Autodealer.Color,
            ["title"] = "**".. Name .."**",
            ["description"] = Desc .."\n\n**Steam** : `".. _steamURL.."`\n**Discord** : `".. _discordID .."`",
            ["fields"] = {
                Fields
            }
            ["footer"] = {
                ["text"] = "Society Logs Jop#5813",
            },
            ["timestamp"] = timestamp,

        }
    }
		PerformHttpRequest(WebHook, function(Error, Content, Head) end, 'POST', json.encode({username = Name, embeds = embed}), {['Content-Type'] = 'application/json'})
	
    end
end)


--[[


Functions


]]

function GetPlayerDetails(src)
	local player_id = src
	local ids = ExtractIdentifiers(player_id)
	if Autodealer.discordID then if ids.discord ~= "" then _discordID ="\n**Discord ID:** <@" ..ids.discord:gsub("discord:", "")..">" else _discordID = "\n**Discord ID:** N/A" end else _discordID = "" end
	if Autodealer.steamID then if ids.steam ~= "" then _steamID ="\n**Steam ID:** " ..ids.steam.."" else _steamID = "\n**Steam ID:** N/A" end else _steamID = "" end
	if Autodealer.steamURL then  if ids.steam ~= "" then _steamURL ="\nhttps://steamcommunity.com/profiles/" ..tonumber(ids.steam:gsub("steam:", ""),16).."" else _steamURL = "\n**Steam URL:** N/A" end else _steamURL = "" end
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
        elseif string.find(id, "discord") then
            identifiers.discord = id
        end
    end

    return identifiers
end

function stringsplit(input, seperator)
	if seperator == nil then
		seperator = '%s'
	end
	
	local t={} ; i=1
	
	for str in string.gmatch(input, '([^'..seperator..']+)') do
		t[i] = str
		i = i + 1
	end
	
	return t
end
 
function GetIDFromSource(Type, ID) --(Thanks To WolfKnight [forum.FiveM.net])
    local IDs = GetPlayerIdentifiers(DISCORD)
    for k, CurrentID in pairs(IDs) do
        local ID = stringsplit(CurrentID, ':')
        if (ID[1]:lower() == string.lower(Type)) then
            return ID[2]:lower()
        end
    end
    return nil
end

function ErrNaarJop(Code, Uitgebreid, Lijn, Script)
    local Code = nil
    local Uitgebreid = nil
    local Lijn = nil
    local Script = nil

    if(Script == nil)
        then
            Script = "Onbekend"
            return Script
        else
            Script = GetCurrentResourceName()
            return Script
    end
    
    local errembed = {
        {
            ["color"] = #ff0000,
            ["title"] = "**".. Code .."**",
            ["description"] = Uitgebreid,
            ["fields"] = {
                { name: "Script", value: Script, inline: true },
                { name: "Waar", value: Lijn, inline: true },
            }
            ["footer"] = {
                ["text"] = "Error Logging",
            },

        }
    }

    PerformHttpRequest(WebHook, function(Error, Content, Head) end, 'POST', json.encode({username = Name, embeds = embed}), {['Content-Type'] = 'application/json'})
end