--[[
    Benediction Lua Scripts
    Creature 11064 - Darrowshire Spirit
    Developed by Asura
--]]

local sayArray = { 6427, 6428, 6429, 6430, 6431 }

function Ghoul_OnDestruction(Unit)
    --When Ghoul dies spawn a spirit at their spot
    Unit:CastSpell(Unit, 17310, true)
end

-- No globals required this way
function Spirit_OnSpawn(Unit)
    -- Visual spawn spell
    Unit:CastSpell(Unit, 17321, true)


    -- Set a gossip id
    local val = math.random(1, 5)
    Unit:SetGossipText(sayArray[val])

    Unit:Despawn(30000, 0)
end

function Spirit_OnGossip(Unit, Player)

    local QuestLog = Player:GetQuestLogEntry(5211)
    if QuestLog ~= nil then
        QuestLog:AddKill(0, Unit:GetGuid())
        QuestLog:UpdatePlayerFields()

        if QuestLog:CanBeFinished() then
            QuestLog:SendQuestComplete()
        else
        end
    else
    end
end

RegisterUnitEvent(8532, 2, "Ghoul_OnDestruction")
RegisterUnitEvent(8531, 2, "Ghoul_OnDestruction")
RegisterUnitEvent(8530, 2, "Ghoul_OnDestruction")

RegisterUnitEvent(11064, 1, "Spirit_OnSpawn")
RegisterUnitEvent(11064, 19, "Spirit_OnGossip")