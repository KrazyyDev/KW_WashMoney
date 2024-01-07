Citizen.CreateThread(function()
    loadModel(_Krazyy["Ped_Model"])
    PedGoFast = CreatePed(4, _Krazyy["Ped_Model"], _Krazyy["Ped_Position"].x, _Krazyy["Ped_Position"].y, _Krazyy["Ped_Position"].z -1, _Krazyy["Ped_Position"].w, false, true)
    FreezeEntityPosition(PedGoFast, true)
    SetEntityInvincible(PedGoFast, true)
    SetBlockingOfNonTemporaryEvents(PedGoFast, true)

    if _Krazyy["Target_Mode"]:upper() == "OXTARGET" then
        exports["ox_target"]:addLocalEntity(PedGoFast, {
            name = 'pedgofast',
            icon = _Krazyy["Target_Icon"],
            label =  _Krazyy["Target_Label"],
            onSelect = function()
                Open_Input_WashMoney()
            end
        })
    elseif _Krazyy["Target_Mode"]:upper() == "SHOWHELP" then
        local Destination = vector3(_Krazyy["Ped_Position"].x, _Krazyy["Ped_Position"].y, _Krazyy["Ped_Position"].z)
        while true do
            timer_wait = 1000 
            local playerCoords = GetEntityCoords(PlayerPedId())
            local distance = #(playerCoords - Destination)
            if distance < 2 then 
                timer_wait = 0
                ShowHelpNotification(_Krazyy["Help_Notif_Text"])
                if IsControlJustPressed(0, 51) then
                    Open_Input_WashMoney()
                end
            end
            Wait(timer_wait)
        end
    elseif _Krazyy["Target_Mode"]:upper() == "3DTEXT" then
        local Destination = vector3(_Krazyy["Ped_Position"].x, _Krazyy["Ped_Position"].y, _Krazyy["Ped_Position"].z)
        while true do
            timer_wait = 1000 
            local playerCoords = GetEntityCoords(PlayerPedId())
            local distance = #(playerCoords - Destination)
            if distance < 2 then 
                timer_wait = 0
                DrawText3D(_Krazyy["Ped_Position"].x, _Krazyy["Ped_Position"].y, _Krazyy["Ped_Position"].z , _Krazyy["3DText_Text"])
                if IsControlJustPressed(0, 51) then
                    Open_Input_WashMoney()
                end
            end
            Wait(timer_wait)
        end
    end
end)