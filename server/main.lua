ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent('KW:Wash:Money:Script')
AddEventHandler('KW:Wash:Money:Script', function(somme)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local PlayerMoney = xPlayer.getAccount("black_money").money
    
    if PlayerMoney >= somme then
        if _Krazyy["Prevent_Disconnect"] then
            TriggerClientEvent('esx:showNotification', _src, "Ne vous déconnecter pas pendant le blanchiment, attendez la fin (~r~".._Krazyy["Wash_Time"].." secondes~s~)")
        end
        xPlayer.removeAccountMoney("black_money", somme)
        Citizen.Wait(_Krazyy["Wash_Time"]* 1000)
        xPlayer.addAccountMoney('money', somme * _Krazyy["Wash_Money"])
        ServerNotify(_src , somme)
        
    else
        TriggerClientEvent('esx:showNotification', _src, "~r~Vous n'avez pas assez d'argent sale")
    end

end)

function ServerNotify(source, somme)
    TriggerClientEvent('esx:showNotification', source, "Vous avez blanchi ~g~" .. somme .. "$~s~ d'argent sale")
    
    local message = "Le joueur **" .. GetPlayerName(source) .. "** a blanchi **" .. somme .. "$** d'argent sale"
    SendDiscordLogs(message, source)
end
