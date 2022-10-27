
--[[
    payload : @array = {
        type = @string, -- inform error success
        text = @string,
        length = @number
    }
]]

RegisterNetEvent('erp_notifications:client:SendAlert')
AddEventHandler('erp_notifications:client:SendAlert', function(payload)

    if (payload['type'] == 'inform') then
        payload['type'] = 'info'
    end

    exports['dt-notifyAlert']:callNotify({
        ['topic'] = "MDT",
        ['message'] = paylaod['text'],
        ['type'] = payload['type'],
        ['timeout'] = payload['length']
      })
end)