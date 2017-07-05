--[[
    Benediction Lua Scripts
    Creature 2948 - Mull Thunderhorn
    Developed by Asura

    Quest 748: Poison Water
    Quest 756: Thunderhorn Totem
    Quest 759: Wildmane Totem
--]]

local sequence = 0

local mullEmote = { 952, 955, 999, 1000, 1001, 1002, 1003, 1004 }
local mullSay = { 953, 954, 1005, 1006, 1007, 1008, 1009, 1010 }

local playerTarget = nil

function Mull_OnConcludeQuest(Unit, QuestId, Player)
    if sequence == 0 then
        if QuestId == 748 or QuestId == 756 or QuestId == 759 then
            Unit:SetNpcFlags(0)
            Unit:CreateTimer("TotemTimer", 1000)
            playerTarget = Player
            sequence = 1
        end
    end
end

function Mull_AIUpdate(Unit, mapScript, timeDiff)
    Unit:UpdateTimers(timeDiff)
    if Unit:IsTimerFinished("TotemTimer") then
        if sequence == 1 then
            Unit:ResetTimer("TotemTimer", 6000)
            Unit:ForceCastSpell(Unit, 4983, false, 0)
            if playerTarget ~= nil then
                local textChoice = math.random(1, 8)
                Unit:SendScriptTextWithTarget(playerTarget, 13, mullEmote[textChoice])
            end
            sequence = 2
        elseif sequence == 2 then
            Unit:RemoveTimer("TotemTimer")
            Unit:SetNpcFlags(2)
            if playerTarget ~= nil then
                local sayChoice = math.random(1, 8)
                Unit:SendScriptTextWithTarget(playerTarget, 11, mullSay[sayChoice])
            end
            sequence = 0
        end
    end
end

RegisterUnitEvent(2948, 17, "Mull_OnConcludeQuest")
RegisterUnitEvent(2948, 23, "Mull_AIUpdate")