--[[
    Jadefire Lua Scripts
    Creature 2706 - Tor'gan
    Developed by Rodeg
--]]

function Torgan_OnConcludeQuest(Unit, QuestId, Player)
    if QuestId == 701 then
        Unit:SetNpcFlags(0)
        Unit:CreateTimer("constructOrbTimer", 3000)
        Unit:CastSpell(Unit, 4093, false)      
    end
    
    if QuestId == 640 then
        Unit:SetNpcFlags(0)
        Unit:CreateTimer("constructOrbTimer", 3000)
        Unit:CastSpell(Unit, 4093, false)      
    end
end

function Torgan_AIUpdate(Unit, mapScript, timeDiff)
    Unit:UpdateTimers(timeDiff)
    if Unit:IsTimerFinished("constructOrbTimer") then
        --Reset flags back and remove timer
        Unit:SetNpcFlags(2)
        Unit:RemoveTimer("constructOrbTimer")
    end
    
    if Unit:IsTimerFinished("reconstructTimer") then
        --Reset flags back and remove timer
        --TODO need to add the proper text
        Unit:SetNpcFlags(2)
        Unit:RemoveTimer("reconstructTimer")
    end
end


RegisterUnitEvent(2706, 17, "Torgan_OnConcludeQuest")
RegisterUnitEvent(2706, 23, "Torgan_AIUpdate")