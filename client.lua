Citizen.CreateThread(function()
while true do
    Citizen.Wait(0)
local playerPed = PlayerPedId()
local vehicle
vehicle = GetVehiclePedIsIn(playerPed, false)
local roll =    GetEntityRoll(playerPed)
if(roll >= -7) then
    if(roll <= 10) then
        if(roll >= 170) then
            DisableControlAction(playerPed, 59,false)
            DisableControlAction(playerPed, 63,false)
        else
            EnableControlAction(playerPed,59,true)
            EnableControlAction(playerPed,63,true)
        end
elseif(roll <= -13) then
    EnableControlAction(playerPed,59,true)
    EnableControlAction(playerPed,63,true)
elseif(roll <= -170) then
    DisableControlAction(playerPed, 59,false)
    DisableControlAction(playerPed, 63,false)
else
    DisableControlAction(playerPed, 59,false)
    DisableControlAction(playerPed, 63,false)
end end end end)


RegisterCommand('checkroll', function() 
    local playerPed = PlayerPedId()
    local vehicle
    vehicle = GetVehiclePedIsIn(playerPed, false)
    local roll =    GetEntityRoll(playerPed)
    TriggerEvent('pNotify:SendNotification', {
        text = {roll}
    })
    print(roll)
end,false)