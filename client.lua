
local wait = 0
Citizen.CreateThread(function()
while true do
Citizen.Wait(wait)
local playerPed = PlayerPedId()
local vehicle = GetVehiclePedIsIn(playerPed, false)
if(vehicle >= 1) then
local tyrecount = GetVehicleNumberOfWheels(vehicle)
local onwheels  =IsVehicleOnAllWheels(vehicle)
end
local roll =    GetEntityRoll(playerPed)
local onroof = 0
local enablecontrol = 1

local good
if(tyrecount == 2) then
    good = 0
elseif(tyrecount >= 2) then
    good = 1
else
    good = 0
end 
if(roll >= 15) then
onroof = 1
elseif(roll <= -30) then
onroof = 1
end

if(onwheels == false) then
    if(vehicle >= 1) then
        if(good == 1) then
            if(onroof == 1) then
                    enablecontrol = 1
            else
                enablecontrol = 1
            end
        else
        enablecontrol = 1
        end
    else
    enablecontrol = 1
    end
else
    enablecontrol = 1
end

if(enablecontrol == 1) then
    EnableControlAction(playerPed,59,true)-- INPUT_VEH_MOVE_LR
elseif(enablecontrol == 0) then
    -- 
    DisableControlAction(playerPed, 59,false) -- INPUT_VEH_MOVE_LR
end
end end)



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

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000)
        local playerPed = PlayerPedId()
        local vehicle
        vehicle = GetVehiclePedIsIn(playerPed, false)
        local roll =    GetEntityRoll(playerPed)
        TriggerEvent('pNotify:SendNotification', {
            text = {roll}
        })
    end
end)