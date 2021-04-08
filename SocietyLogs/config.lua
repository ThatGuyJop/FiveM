--[[

THANKS FOR INSTALLING AND MAYBE USING THE SCRIPT.

THIS SCRIPT IS CONTINUESLY IN DEVELOPMENT WITH SUGGESTIONS MADE BY YOU GUYS.
I WILL RARELY LOOK ON THE FIVEM PAGE SO IF YOU HAVE ANY SUGGESTIONS/BUGS
POST THEM ON THE GITHUB.

]]






SCLogs = {}

SCLogs.WHConfig = {
    Color = "#cc66ff",
    Inline = true,
}
-- SCLogs.SocietyNaam = "",
-- SCLogs.SocietyRekening = "",-- Society rekening hier (society-SCLogs)
SCLogs.VerkoopWH    = "DISCORD_WEBHOOK",-- Verkoop Webhook ID hier
SCLogs.InkoopWH     = "DISCORD_WEBHOOK",-- Inkoop Webhook ID hier
SCLogs.GeldWH       = "DISCORD_WEBHOOK",-- Geld Webhook ID hier
SCLogs.KluisWH      = "DISCORD_WEBHOOK",-- Kluis Webhook ID hier
SCLogs.StockWH      = "DISCORD_WEBHOOK",-- Stock Webhook ID hier

SCLogs.steamID      = true				-- set to false to disable Steam ID in the logs
SCLogs.steamURL     = true				-- set to false to disable Steam URL in the logs
SCLogs.discordID    = true				-- set to false to disable Discord ID in the logs
SCLogs.username     = "LOGS_IF_NO_WEBHOOK_IS_SPECIFIED" 							-- Bot Username
SCLogs.avatar       = "IMAGE URL"				-- Bot Avatar

--[[ 
    

MORE CONFIG WILL BE ADDED IN NEAR FUTURE
JUST A SNEAKPEAK DOWN BELOW

NOTE: Webhooks below are for show purpose only!

SCLogs.Webhooks = {
    MoneyTrans = {
        WEBHOOK1 = {
            {
                URL = "WEBHOOK_URL",
                COLOR = "#FF0000",
            }
        },
        WEBHOOK2 = {
            {
                URL = "WEBHOOK_URL",
                COLOR = "#FF0000",
            }
        }
    },
    WeaponTrans = {
        WEBHOOK1 = {
            {
                URL = "WEBHOOK_URL",
                COLOR = "#FF0000",
            }
        }
    },
    StockWH = {
        WEBHOOK1 = {
            {
                URL = "WEBHOOK_URL",
                COLOR = "#FF0000",
            }
        }
    }
},

]]