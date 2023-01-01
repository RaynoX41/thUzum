local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("uzum")
AddEventHandler("uzum", function()
    local xPlayer = QBCore.Functions.GetPlayer(source)
    xPlayer.Functions.AddItem("uzum", math.random(Config.uzummin,Config.uzummax))
end)

RegisterNetEvent("uzumisleme")
AddEventHandler("uzumisleme", function()
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local item = math.random(1,100)
    if xPlayer.Functions.RemoveItem("uzum", Config.uzumislememiktar) then
        if item > Config.kotusarapsans then
            xPlayer.Functions.AddItem("sarap", 1)
        else
            xPlayer.Functions.AddItem("kotusarap", 1)
        end
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Şarap Yaptın!', length = 2500})
    else
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Yeterince Üzümün Yok!', length = 2500})
    end
end)

RegisterNetEvent("sarapsatis")
AddEventHandler("sarapsatis", function()
    local xPlayer = QBCore.Functions.GetPlayer(source)

    if xPlayer.Functions.RemoveItem("sarap", Config.sarapsatismiktar) then
        xPlayer.Functions.AddMoney(Config.sarapbankorcash, Config.sarapfiyat)
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Şarap Sattın!', length = 2500})
    elseif xPlayer.Functions.RemoveItem("kotusarap", Config.sarapsatismiktar) then
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Kötü Şarap Sattın!', length = 2500})
        xPlayer.Functions.AddMoney(Config.sarapbankorcash, Config.kotusarapfiyat)
    else
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Yeterince Şarabın Yok!', length = 2500})
    end
end)