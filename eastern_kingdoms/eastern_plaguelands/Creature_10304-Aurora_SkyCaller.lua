--[[
    Jadefire Lua Scripts
    Quest 10304 - Aurora Skycaller
    Developed by Rodeg
--]]

function Aurora_OnConcludeQuest(Unit, QuestId, Player)
    if QuestId == 5247 then
        --Cast spell for 5 seconds and set NPC flags so player can't interact
        Unit:SetNpcFlags(0)
        Unit:CreateTimer("itemCreateTimer", 5000)
        Unit:CastSpell(Unit, 16633, false)
    end
end

function Aurora_AIUpdate(Unit, mapScript, timeDiff)
    Unit:UpdateTimers(timeDiff)
    if Unit:IsTimerFinished("itemCreateTimer") then
        --Reset flags back and remove timer
        Unit:SetNpcFlags(2)
        Unit:RemoveTimer("itemCreateTimer")
    end
end

RegisterUnitEvent(10304, 17, "Aurora_OnConcludeQuest")
RegisterUnitEvent(10304, 23, "Aurora_AIUpdate")