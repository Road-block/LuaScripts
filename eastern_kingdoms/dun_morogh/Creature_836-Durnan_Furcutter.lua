--[[
    Benediction Lua Scripts
    Creature 836 - Durnan Furcutter
    Developed by Asura

    Quest 3364: Scalding Mornbrew Delivery
--]]

local sequence = 0

function Durnan_OnConcludeQuest(Unit, QuestId, Player)
    if sequence == 0 then
        if QuestId == 3364 then
            Unit:SendScriptTextById(11, 4377)
            Unit:CreateTimer("TextTimer", 2000)
            sequence = 1
        end
    end
end

function Durnan_AIUpdate(Unit, mapScript, timeDiff)
    Unit:UpdateTimers(timeDiff)
    if Unit:IsTimerFinished("TextTimer") then
        if sequence == 1 then
            Unit:ResetTimer("TextTimer", 4000)
            Unit:ForceCastSpell(Unit, 5257, false, 0)
            sequence = 2
        elseif sequence == 2 then
            Unit:ResetTimer("TextTimer", 6000)
            Unit:SetEmoteState(10);
            Unit:SendScriptTextById(11, 4378)
            sequence = 3
        elseif sequence == 3 then
            Unit:RemoveTimer("TextTimer")
            Unit:SetEmoteState(0);
            sequence = 0
        end
    end
end

RegisterUnitEvent(836, 17, "Durnan_OnConcludeQuest")
RegisterUnitEvent(836, 23, "Durnan_AIUpdate")