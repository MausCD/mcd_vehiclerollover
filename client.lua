Citizen.CreateThread(function()
while true do
    Citizen.Wait(0)
local playerPed = PlayerPedId()
local vehicle
vehicle = GetVehiclePedIsIn(playerPed, false)
local roll =    GetEntityRoll(playerPed)
if(roll >= -10) then
    if(roll <= 10) then
        EnableControlAction(playerPed,59,true)
        EnableControlAction(playerPed,63,true)
    else
        DisableControlAction(playerPed, 59,false)
        DisableControlAction(playerPed, 63,false)
    end
else
    DisableControlAction(playerPed, 59,false)
    DisableControlAction(playerPed, 63,false)
end end end)