--[[
    Benediction Lua Scripts
    Creature 2700 - Captain Nials
    Developed by Rodeg
--]]

-- Notes from Asura: Emotes can be added to text in database, and dropped from script.
-- Could also move TextIds to an array (or multiple), then just call SendScriptTextById(11, array[rand]) 
-- to save lines, but that's just to keep it clean

--Start of the text range for the names
local sequence = 1

function Nials_OnConcludeQuest(Unit, QuestId, Player)
    if QuestId == 682 then
        --Move over to tree stump
        Unit:SetNpcFlags(0)
        Unit:SetSheathState(2)
        Unit:MoveToLocation(-1273.320190,-2514.262939,21.457598,1.489457,false,false,false,false)       
        Unit:CreateTimer("TextTimer", 1600)
    end
end

function Nials_AIUpdate(Unit, mapScript, timeDiff)
    Unit:UpdateTimers(timeDiff)
    if Unit:IsTimerFinished("TextTimer") then                          
        local rand = math.random(1,4)
        if sequence == 1 then
            --Send the emote text
            Unit:SendScriptTextById(13, 873)
            Unit:ResetTimer("TextTimer", 3500)   
            sequence = 2        
        elseif sequence == 2 then         
            --Text for dead soldiers is randomized              
            if rand == 1 then               
                Unit:SendScriptTextById(11, 874)                
            elseif rand == 2 then
                Unit:SendScriptTextById(11, 875)
            elseif rand == 3 then
                Unit:SendScriptTextById(11, 876)
            elseif rand == 4 then
                Unit:SendScriptTextById(11, 877)
            end
            Unit:ResetTimer("TextTimer", 3500)
            Unit:SendEmote(1)
            sequence = 3
        elseif sequence == 3 then
            if rand == 1 then
                Unit:SendScriptTextById(11, 878)
            elseif rand == 2 then
                Unit:SendScriptTextById(11, 879)
            elseif rand == 3 then
                Unit:SendScriptTextById(11, 880)
            elseif rand == 4 then
                Unit:SendScriptTextById(11, 881)
            end
            Unit:ResetTimer("TextTimer", 3500)
            Unit:SendEmote(1)
            sequence = 4
        elseif sequence == 4 then
            Unit:SendScriptTextById(13, 882)
            Unit:ResetTimer("TextTimer", 3500)
            sequence = 5
        elseif sequence == 5 then
            Unit:SendScriptTextById(11, 883)
            Unit:ResetTimer("TextTimer", 4500)
            Unit:SendEmote(1)
            sequence = 6
        elseif sequence == 6 then
            Unit:SendScriptTextById(11, 884)
            Unit:SendEmote(1)
            Unit:RemoveTimer("TextTimer")
            Unit:SetNpcFlags(2)
            Unit:SetSheathState(1)
            Unit:MoveHome()
            --Reset sequence
            sequence = 1
        end           
    end
end
    
RegisterUnitEvent(2700, 17, "Nials_OnConcludeQuest")
RegisterUnitEvent(2700, 23, "Nials_AIUpdate")