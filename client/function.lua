function loadModel(model)
    if type(model) == 'number' then
        model = model
    else
        model = GetHashKey(model)
    end
    while not HasModelLoaded(model) do
        RequestModel(model)
        Citizen.Wait(0)
    end
end

function ShowHelpNotification(msg)
    BeginTextCommandDisplayHelp( "STRING" )
    AddTextComponentSubstringPlayerName( msg )
    EndTextCommandDisplayHelp( 0, 0, 1, -1 )
end

function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.025+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

function Open_Input_WashMoney()
    local input = lib.inputDialog('Blanchiment', {
        {type = 'number', label = 'Somme à blanchir', icon = 'hashtag'},
    })    
    if input == nil then
        return
    else
        TriggerServerEvent('KW:Wash:Money:Script', input[1])
    end
end
