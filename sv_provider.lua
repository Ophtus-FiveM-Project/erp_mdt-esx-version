local bufferCid = {};

RegisterNetEvent('echorp:getplayerfromid')
AddEventHandler('echorp:getplayerfromid', function(source, cb)
    local _source = source;
    local xPlayer = ESX.GetPlayerFromId(_source);
    if (not xPlayer) then return cb(false) end;
    local jobDetail = xPlayer.getJob();
    local dataCallback = {
        ['job'] = {
            isPolice = jobDetail.name == 'police',
            name = jobDetail.name,
            grade = jobDetail.grade
        },
        ['source'] = source,
        ['fullname'] = xPlayer.getName(),
        ['firstname'] = xPlayer.get('firstname'),
        ['lastname'] = xPlayer.get('lastname'),
    };

    cb(dataCallback)
end)

function getCallsignFromAnotherTable(identifier)
    if (bufferCid[identifier]) then
        return bufferCid[identifier]
    end

    local existsData = exports['oxmysql']:single("SELECT * FROM call_sign_users WHERE identifier = ?", {
        identifier
    });

    if (existsData) then
        bufferCid[identifier] = existsData['cid'];
        return existsData['cid'];
    end

    local generateCallsign = math.random(1111,9999);

    local insertNewCallsign = exports['oxmysql']:insert("INSERT INTO call_sign_users (identifier, cid) VALUES (?,?)",{
        identifier,
        generateCallsign
    });

    if (insertNewCallsign) then
        bufferCid[identifier] = generateCallsign;
        return generateCallsign
    end
end

function updateCallsign(identifier, newCallsign)
    local updateCallsign = exports['oxmysql']:update("UPDATE call_sign_users SET cid = ? WHERE identifier = ?", {
        newCallsign, identifier
    });

    bufferCid[identifier] = updateCallsign;

    return updateCallsign;
end