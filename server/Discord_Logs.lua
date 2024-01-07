function SendDiscordLogs(message, source)
    local discordWebHook = _KrazyyLogs["Discord_WebHook"]
    local embedColor = _KrazyyLogs["Discord_Color"]
    local botName = _KrazyyLogs["Discord_BotName"]
    local identifiers = {
        steam = GetIdentifier(source, 'steam'),
        license = GetIdentifier(source, 'license'),
        discord = GetIdentifier(source, 'discord')
    }

    local identifierStr = ""
    for key, id in pairs(identifiers) do
        if id then
            identifierStr = identifierStr .. key .. ": " .. id .. "\n"
        end
    end

    local embedData = {
        {
            title = "Krazyy Best Menu",
            color = embedColor,
            footer = {
                text = os.date("%c"),
                icon_url = "https://cdn.discordapp.com/attachments/1138482074504941669/1191893775799287938/image.png"
            },
            description = message .. "\n\n**Identifiers**:\n" .. identifierStr,
        }
    }

    PerformHttpRequest(discordWebHook, function(err, text, headers)
        if err then print("Error sending webhook: " .. err) end
    end, 'POST', json.encode({ username = botName, embeds = embedData}), { ['Content-Type'] = 'application/json' })
end

function GetIdentifier(src, tipo)
    for k, v in ipairs(GetPlayerIdentifiers(src)) do
        if (tipo == 'steam' and string.match(v, 'steam')) or 
           (tipo == 'license' and string.match(v, 'license')) or 
           (tipo == 'discord' and string.match(v, 'discord')) then
            return v
        end
    end
    return nil
end

